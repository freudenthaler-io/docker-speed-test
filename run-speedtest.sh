#!/usr/bin/env bash

# Check for Windows and required tools
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    if ! command -v bash >/dev/null 2>&1; then
        echo "Error: Bash is required. Please use Git Bash, WSL2, or similar."
        exit 1
    fi
fi

# Check if bc is available (required for floating point math)
if ! command -v bc >/dev/null 2>&1; then
    echo "Error: 'bc' is required but not installed."
    if [[ "$OSTYPE" == "msys" ]]; then
        echo "For Git Bash, install it using: pacman -S bc"
    elif [[ "$OSTYPE" == "cygwin" ]]; then
        echo "For Cygwin, install it using the Cygwin installer"
    else
        echo "Please install 'bc' using your package manager"
    fi
    exit 1
fi

# Colors and formatting (with Windows compatibility)
if [[ -t 1 ]]; then
    GREEN='\033[0;32m'
    BLUE='\033[0;34m'
    RED='\033[0;31m'
    NC='\033[0m'
    BOLD='\033[1m'
else
    GREEN=''
    BLUE=''
    RED=''
    NC=''
    BOLD=''
fi

# Loading Animation
spinner=( "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" )

# Function for loading animation
loading() {
    local pid=$1
    local message=$2
    local i=0
    while kill -0 $pid 2>/dev/null; do
        printf "\r${BLUE}${spinner[i]} ${message}${NC}"
        i=$(( (i+1) % ${#spinner[@]} ))
        sleep 0.1
    done
    printf "\r${GREEN}✓ ${message}${NC}\n"
}

# Function to execute commands with loading animation
run_with_loading() {
    local command="$1"
    local message="$2"
    ($command) >/dev/null 2>&1 &
    loading $! "$message"
}

# Title
echo -e "\n${BOLD}🚀 Docker Speed Test${NC}\n"

# Docker check with detailed error message
if ! command -v docker &>/dev/null; then
    echo -e "${RED}✗ Docker is not installed or not in PATH${NC}"
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        echo "Please install Docker Desktop for Windows and ensure it's running"
    fi
    exit 1
fi

# Check Docker daemon
if ! docker info >/dev/null 2>&1; then
    echo -e "${RED}✗ Docker daemon is not running${NC}"
    if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
        echo "Please start Docker Desktop for Windows"
    fi
    exit 1
fi

# Main process
echo -e "🔄 Starting speed test...\n"

# Remove image if exists
run_with_loading "docker image rm speedtest-image 2>/dev/null || true" "Cleaning up old images"

# Ubuntu base image
run_with_loading "docker pull ubuntu:latest" "Pulling Ubuntu base image"

# Build with time measurement
echo -e "\n${BOLD}⏱️  Measuring build speed...${NC}"
start_time=$(date +%s.%N)

# Perform build
run_with_loading "docker build --pull=false -t speedtest-image ." "Building Docker image"

# End time and calculation
end_time=$(date +%s.%N)
build_time=$(echo "$end_time - $start_time" | bc)
formatted_time=$(printf "%.2f" $build_time)

# Output result
echo -e "\n${BOLD}📊 Result:${NC}"
echo -e "${GREEN}Build time: ${formatted_time} seconds${NC}\n"

# Verification
verify_output=$(docker run --rm speedtest-image 2>/dev/null)
if [ "$verify_output" == "Speed test" ]; then
    echo -e "${GREEN}✓ Verification successful${NC}"
else
    echo -e "${RED}✗ Verification failed${NC}"
fi

# Automatic cleanup after test
echo -e "\n${BOLD}🧹 Cleanup${NC}"
if docker image rm speedtest-image >/dev/null 2>&1; then
    echo -e "${GREEN}✓ Test image removed${NC}\n"
else
    echo -e "${RED}✗ Failed to remove test image${NC}\n"
fi 
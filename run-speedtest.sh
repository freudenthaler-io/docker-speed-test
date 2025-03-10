#!/bin/bash

# Colors and formatting
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

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

# Docker check
if ! command -v docker &>/dev/null; then
    echo -e "${RED}✗ Docker is not installed${NC}"
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

# Optional: Verification
verify_output=$(docker run --rm speedtest-image 2>/dev/null)
if [ "$verify_output" == "Speed test" ]; then
    echo -e "${GREEN}✓ Verification successful${NC}\n"
else
    echo -e "${RED}✗ Verification failed${NC}\n"
fi 
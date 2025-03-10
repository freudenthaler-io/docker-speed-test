#!/bin/bash

# Farben und Formatierung
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'
BOLD='\033[1m'

# Loading Animation
spinner=( "⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏" )

# Funktion für Loading-Animation
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

# Funktion zum Ausführen von Befehlen mit Loading-Animation
run_with_loading() {
    local command="$1"
    local message="$2"
    ($command) >/dev/null 2>&1 &
    loading $! "$message"
}

# Titel
echo -e "\n${BOLD}🚀 Docker Speed Test${NC}\n"

# Docker-Check
if ! command -v docker &>/dev/null; then
    echo -e "${RED}✗ Docker ist nicht installiert${NC}"
    exit 1
fi

# Hauptprozess
echo -e "🔄 Starte Geschwindigkeitstest...\n"

# Image löschen falls vorhanden
run_with_loading "docker image rm speedtest-image 2>/dev/null || true" "Bereinige alte Images"

# Ubuntu base image
run_with_loading "docker pull ubuntu:latest" "Lade Ubuntu Base Image"

# Build mit Zeitmessung
echo -e "\n${BOLD}⏱️  Messe Build-Geschwindigkeit...${NC}"
start_time=$(date +%s.%N)

# Build durchführen
run_with_loading "docker build --pull=false -t speedtest-image ." "Baue Docker Image"

# Endzeit und Berechnung
end_time=$(date +%s.%N)
build_time=$(echo "$end_time - $start_time" | bc)
formatted_time=$(printf "%.2f" $build_time)

# Ergebnis ausgeben
echo -e "\n${BOLD}📊 Ergebnis:${NC}"
echo -e "${GREEN}Build-Zeit: ${formatted_time} Sekunden${NC}\n"

# Optional: Verifizierung
verify_output=$(docker run --rm speedtest-image 2>/dev/null)
if [ "$verify_output" == "Speed test" ]; then
    echo -e "${GREEN}✓ Verifizierung erfolgreich${NC}\n"
else
    echo -e "${RED}✗ Verifizierung fehlgeschlagen${NC}\n"
fi 
# 🚀 Docker Build Speed Test

An elegant tool for comparing Docker build speeds across different systems.

## ✨ Features

- Clean progress display with loading animation
- Precise build time measurement
- Automatic build verification
- Minimal yet informative output
- Cross-platform support

## 📋 Prerequisites

- Docker must be installed
- Git for repository access
- Unix-like environment (bash shell)

## 🚀 Quick Start

### Unix-based Systems (Linux & macOS)

```bash
# 1. Clone repository
git clone https://github.com/freudenthaler-io/docker-speed-test.git
cd docker-speed-test

# 2. Make script executable and run
chmod +x run-speedtest.sh
./run-speedtest.sh
```

### Windows Environment

Choose the method that best suits your setup:

#### Option 1: WSL2 (Recommended for Best Performance)
Requirements:
- Windows Subsystem for Linux 2 (WSL2)
- Docker Desktop with WSL2 backend

```bash
# 1. Open WSL terminal and clone repository
git clone https://github.com/freudenthaler-io/docker-speed-test.git
cd docker-speed-test

# 2. Make script executable
chmod +x run-speedtest.sh

# 3. Run test
./run-speedtest.sh
```

#### Option 2: Git Bash (Recommended for Simplicity)
Requirements:
- Git Bash
- Docker Desktop

```bash
# 1. Open Git Bash and clone repository
git clone https://github.com/freudenthaler-io/docker-speed-test.git
cd docker-speed-test

# 2. Run test
./run-speedtest.sh
```

> **Note**: Pure PowerShell execution is not supported as the script requires a bash shell environment. We recommend using either WSL2 (for best performance) or Git Bash (for simplicity) on Windows systems.

## 📊 Example Output

```
🚀 Docker Speed Test

🔄 Starting speed test...

✓ Cleaning up old images
✓ Pulling Ubuntu base image

⏱️  Measuring build speed...
✓ Building Docker image

📊 Result:
Build time: 41.78 seconds

✓ Verification successful
```

## 🔍 Technical Details

The test image is based on `ubuntu:latest` and compiles a simple C program. The entire build process runs automatically and displays only relevant information.

## 💻 Performance Notes

### Native Performance
- **Linux**: Native Docker performance, optimal for testing
- **macOS**: Native Docker performance via virtualization

### Windows Performance
- **WSL2**: Best performance on Windows, recommended for power users
- **Git Bash**: Good performance, recommended for simple setups

## 📜 License

This project is licensed under the [MIT License](LICENSE).


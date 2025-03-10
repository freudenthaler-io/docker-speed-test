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

#### Option 1: WSL2 (Recommended)
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

#### Option 2: Git Bash
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

#### Option 3: PowerShell
Requirements:
- PowerShell
- Git for Windows
- Docker Desktop

```powershell
# 1. Open PowerShell and clone repository
git clone https://github.com/freudenthaler-io/docker-speed-test.git
cd docker-speed-test

# 2. Run test using Git's bash
& 'C:\Program Files\Git\bin\bash.exe' -c "./run-speedtest.sh"
```

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
- **WSL2**: Best performance on Windows, recommended approach
- **Git Bash**: Good performance, simple setup
- **PowerShell**: Good performance, familiar for Windows admins

## 📜 License

This project is licensed under the [MIT License](LICENSE).


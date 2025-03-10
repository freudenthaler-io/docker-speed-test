# 🚀 Docker Build Speed Test

An elegant tool for comparing Docker build speeds across different systems.

## ✨ Features

- Clean progress display with loading animation
- Precise build time measurement
- Automatic build verification
- Minimal yet informative output

## 📋 Prerequisites

- Docker must be installed

## 🚀 Quick Start

1. Clone repository:
```bash
git clone git@github.com:freudenthaler-io/docker-speed-test.git
cd docker-speed-test
```

2. Run test:
```bash
./run-speedtest.sh
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

## 🔍 Details

The test image is based on `ubuntu:latest` and compiles a simple C program. The entire build process runs automatically and displays only relevant information.

## 📜 License

This project is licensed under the [MIT License](LICENSE).


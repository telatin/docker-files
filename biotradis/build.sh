#!/bin/bash
set -euo pipefail
echo " - building"
sudo docker build -t biotradis:git . > build.log 2>&1
echo " - testing in background"
bash test_fork.sh &

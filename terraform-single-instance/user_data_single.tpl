#!/bin/bash
set -e

# Update & install
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y ca-certificates curl gnupg git

# Docker repo & install
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
chmod a+r /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin

# allow ubuntu user to use docker
usermod -aG docker ubuntu

# clone repo and run compose
cd /home/ubuntu
git clone ${repo_url} app || (cd app && git pull)
cd app
# start docker compose (if compose file at repo root)
docker compose up -d --build

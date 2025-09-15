#!/bin/bash
# Update & Install basics
apt-get update -y
apt-get install -y ca-certificates curl gnupg git

# Install Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update -y
apt-get install -y docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker

# Clone repo and run app
git clone ${repo_url} /app
cd /app
docker build -t myapp .
docker run -d -p 8080:8080 myapp

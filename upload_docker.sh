#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
dockerpath=katft/capstone

# Step 2:  
docker login
docker tag capstone $dockerpath
echo "Docker ID and Image: $dockerpath"

# Step 3:
# Push image to a docker repository
docker push $dockerpath
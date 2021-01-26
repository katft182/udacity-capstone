#!/usr/bin/env bash

# Step 1:
docker build --tag=capstone .

# Step 2: 
# List docker images
docker image ls

# Step 3: 
# Run flask app
docker run -p 8000:8080 capstone

#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath="eisel98/p4mlapp"

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run p4mlapp --image=$dockerpath --port=80 --labels app=mlp4app

# Step 3:
# List kubernetes pods

# Initially, your pod may be in the process of being created, as indicated by 
# STATUS: ContainerCreating, but you just have to wait a few minutes until the 
# pod is ready, then you can run the script again.
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl port-forward p4mlapp 8000:80


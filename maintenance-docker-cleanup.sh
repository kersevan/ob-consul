#!/bin/bash

echo "Starting Docker cleanup..."

# Step 1: Remove all stopped containers
echo "Removing stopped containers..."
docker container prune -f

# Step 2: Remove all dangling (unused) images
echo "Removing dangling images..."
docker image prune -f

# Step 3: Remove all unused images (not just dangling)
echo "Removing all unused images..."
docker image prune -a -f

# Step 4: Remove all unused volumes
echo "Removing unused volumes..."
docker volume prune -f

# Step 5: Remove all unused networks
echo "Removing unused networks..."
docker network prune -f

# Step 6: Optional - Remove all dangling build cache
echo "Cleaning up build cache..."
docker builder prune -f

echo "Docker cleanup completed successfully!"

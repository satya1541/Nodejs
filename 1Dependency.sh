#!/bin/bash

# Update the system and install Node.js setup script
echo "Adding NodeSource repository for Node.js 18.x..."
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sleep 10  # Wait for 10 seconds

# Install Node.js
echo "Installing Node.js..."
sudo apt install -y nodejs
sleep 10  # Wait for 10 seconds

# Verify Node.js installation
echo "Checking Node.js version..."
node --version
sleep 10  # Wait for 10 seconds

# Install npm packages
echo "Installing npm packages..."
npm install
sleep 10  # Wait for 10 seconds

# Start the Node.js server
echo "Starting the Node.js server..."
node server.js &
sleep 10  # Wait for 10 seconds

#install docker
apt install docker.io -y

# Install Docker Compose
echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sleep 10  # Wait for 10 seconds

# List the files in /usr/local/bin/ to verify download
echo "Listing files in /usr/local/bin/..."
ls /usr/local/bin/
sleep 5  # Wait for 5 seconds

# Create a symbolic link for Docker Compose
echo "Creating symbolic link for Docker Compose..."
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sleep 5  # Wait for 5 seconds

# Add execute permissions to Docker Compose binary
echo "Adding execute permissions to Docker Compose binary..."
sudo chmod +x /usr/local/bin/docker-compose
sleep 5  # Wait for 5 seconds

# Verify Docker Compose installation
echo "Checking Docker Compose version..."
docker-compose version

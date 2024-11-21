#!/bin/bash

# Script to automate Jenkins installation and upgrade on Debian-based systems

# Exit the script if any command fails
set -e

echo "Adding the Jenkins repository key to your system..."
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
    https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

echo "Adding Jenkins apt repository entry..."
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian-stable binary/" | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Updating local package index..."
sudo apt-get update

echo "Installing required dependencies..."
sudo apt-get install -y fontconfig openjdk-17-jre

echo "Installing Jenkins..."
sudo apt-get install -y jenkins

echo "Jenkins installation is complete!"
echo "You can start the Jenkins service using: sudo systemctl start jenkins"
echo "Access Jenkins at http://<your-server-ip>:8080"

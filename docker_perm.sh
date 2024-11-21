#!/bin/bash
set -e

echo "Adding Jenkins user to Docker group..."
sudo usermod -aG docker jenkins || { echo "Failed to add Jenkins to Docker group"; exit 1; }
sleep 3

echo "Changing permissions of /var/run/docker.sock..."
chmod 777 /var/run/docker.sock || { echo "Failed to change permissions for /var/run/docker.sock"; exit 1; }
sleep 3

echo "Reloading systemd manager configuration..."
systemctl daemon-reload || { echo "Failed to reload systemd"; exit 1; }
sleep 3

echo "Restarting Jenkins service..."
systemctl restart jenkins || { echo "Failed to restart Jenkins"; exit 1; }
sleep 5

echo "Restarting Docker service..."
systemctl restart docker || { echo "Failed to restart Docker"; exit 1; }
sleep 3

echo "Jenkins and Docker services have been restarted, and the necessary configurations are applied."

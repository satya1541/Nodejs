#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Directory for SSL certificates
CERT_DIR="/root/nginx-certs"
echo "Creating directory: $CERT_DIR"
mkdir -p "$CERT_DIR"

# Move to the directory
cd "$CERT_DIR"

# Generate the SSL certificate and private key
echo "Generating SSL certificate and private key..."
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout nginx-selfsigned.key -out nginx-selfsigned.crt <<EOF
IN
<Your_State>
<Your_City>
<Your_Organization>
<Your_Organizational_Unit>
<Your_Common_Name_or_IP>
<Your_Email>
EOF

# Reload Nginx to apply changes
echo "Reloading Nginx server..."
nginx -s reload

echo "Setup complete. SSL certificates are located in $CERT_DIR."

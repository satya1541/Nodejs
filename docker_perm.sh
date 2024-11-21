#!/bin/bash

sudo usermod -aG docker jenkins
sleep 3

chmod 777 /var/run/docker.sock
sleep 3

systemctl daemon-reload
sleep 3

systemctl restart jenkins
sleep 5

systemctl restart docker
sleep 3

echo "Jenkins and Docker services have been restarted, and the necessary configurations are applied."

sudo usermod -aG docker jenkins
chmod 777 /var/run/docker.sock
systemctl daemon-reload
systemctl restart jenkins
systemctl restart docker

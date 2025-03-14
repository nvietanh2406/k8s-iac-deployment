docker run --name rancher-server -d --restart=unless-stopped -p 8080:80 -p 8443:443 --privileged rancher/rancher:v2.7.1

echo ----------------------------------------------------
echo Install rancher
echo ----------------------------------------------------
docker run -d --restart=unless-stopped -p 8080:8080 rancher/server
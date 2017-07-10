echo ----------------------------------------------------
echo Stop docker
echo ----------------------------------------------------
systemctl stop docker
echo ----------------------------------------------------
echo Backup docker
echo ----------------------------------------------------
cp -au /var/lib/docker /var/lib/docker.bk
echo ----------------------------------------------------
echo Remove old daemon
echo ----------------------------------------------------
rm /etc/docker/daemon.json
echo ----------------------------------------------------
echo Install overlay fs
echo ----------------------------------------------------
echo "{ \"storage-driver\": \"overlay2\" }" > /etc/docker/daemon.json
echo ----------------------------------------------------
echo Start docker
echo ----------------------------------------------------
systemctl start docker
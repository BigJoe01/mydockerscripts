echo ----------------------------------------------------
echo Automatic updates
echo ----------------------------------------------------
apt-get update
echo ----------------------------------------------------
echo Remove old docker.io
echo ----------------------------------------------------
sudo apt-get purge docker.io
echo ----------------------------------------------------
echo Install Virtual base
echo ----------------------------------------------------
apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtualapt-ge
echo ----------------------------------------------------
echo Install http transport, certificates, curl, common
echo ----------------------------------------------------
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
echo ----------------------------------------------------
echo Install GPG key
echo ----------------------------------------------------
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo ----------------------------------------------------
echo Add repository
echo ----------------------------------------------------
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo ----------------------------------------------------
echo Automatic updates
echo ----------------------------------------------------
apt-get update
echo ----------------------------------------------------
echo Install docker
echo ----------------------------------------------------
apt-get install -y docker-ce=17.03.2~ce-0~ubuntu-xenial
echo ----------------------------------------------------
echo Docker installed
echo ----------------------------------------------------
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
echo ----------------------------------------------------
echo Install dev scripts
echo ----------------------------------------------------
apt-get install -y git devscripts debhelper
echo ----------------------------------------------------
echo Install git
echo ----------------------------------------------------
apt-get install -y git
echo ----------------------------------------------------
echo Pull dockergc from github
echo ----------------------------------------------------
git clone https://github.com/spotify/docker-gc.git
echo ----------------------------------------------------
echo Build dockergc
echo ----------------------------------------------------
cd docker-gc
debuild -us -uc -b
echo ----------------------------------------------------
echo Create gc exclude images / containers
echo ----------------------------------------------------
printf "rancher/*" > /etc/docker-gc-exclude
printf "rancher*\nregistry" > /etc/docker-gc-exclude-containers
echo ----------------------------------------------------
echo Create crontab jobs
echo ----------------------------------------------------
crontab -l > current_cron
echo "0,30 * * * * docker-gc" >> current_cron
crontab current_cron
rm current_cron
echo ----------------------------------------------------
echo Run Gc
echo ----------------------------------------------------
dpkg -i ../docker-gc_0.1.0_all.deb

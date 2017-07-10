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

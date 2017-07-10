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


apt-get update
apt-get install ca-certificates curl openssh-server postfix
curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
apt install gitlab-ce

configure '/etc/gitlab'
apt install letsencrypt -y
# ssl letsencrypt certonly -d gitlab
gitlab-ctl reconfigure
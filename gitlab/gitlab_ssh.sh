echo ----------------------------------------------------
echo Gitlab disable ssl settings
echo ----------------------------------------------------
printf "\n# Rancher config ext\nnginx['listen_https'] = false\nnginx['listen_port'] = 80" >> /etc/gitlab/gitlab.rb

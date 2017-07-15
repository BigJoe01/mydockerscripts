sudo apt-key adv --keyserver keyserver.ubuntu.com --recv E0C56BD4    # optional

sudo apt-add-repository "deb http://repo.yandex.ru/clickhouse/xenial stable main"
sudo apt-get update

sudo apt-get install clickhouse-server-common clickhouse-client -y

sudo service clickhouse-server start
clickhouse-client
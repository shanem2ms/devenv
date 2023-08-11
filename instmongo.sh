apt updates
apt update
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-5.0.list
apt-get update
apt-get install -y mongodb-org
mkdir -p ~/data/db
curl https://raw.githubusercontent.com/mongodb/mongo/master/debian/init.d | tee /etc/init.d/mongodb >/dev/null
chmod +x /etc/init.d/mongodb
service mongodb start
service mongodb status

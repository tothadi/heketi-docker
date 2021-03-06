cd /setup
wget https://github.com/heketi/heketi/releases/download/v9.0.0/heketi-v9.0.0.linux.amd64.tar.gz
tar -zxvf heketi-v9.0.0.linux.amd64.tar.gz
chmod +x heketi/heketi
chmod +x heketi/heketi-cli
cp heketi/heketi /usr/local/bin
cp heketi/heketi-cli /usr/local/bin
groupadd --system heketi
useradd -s /sbin/nologin --system -g heketi heketi
mkdir -p /var/lib/heketi /etc/heketi /var/log/heketi
apt update && apt upgrade -y
apt install openssh-server nano curl -y
mkdir /root/.ssh
ssh-keygen -f /etc/heketi/heketi_key -t rsa -N ''
chown heketi:heketi /etc/heketi/heketi_key*
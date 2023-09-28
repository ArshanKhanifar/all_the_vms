echo "hello"
apt update

echo "✅ installing packages"
apt install -y apt-transport-https ca-certificates curl software-properties-common

echo "🐳 downloading docker"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "🐳 adding repo"
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

apt-cache policy docker-ce

echo "🐳 install"
apt install docker-ce

echo "🤨 getting docker status"
systemctl status docker


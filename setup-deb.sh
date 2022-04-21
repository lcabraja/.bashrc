# Docker
# https://docs.docker.com/engine/install/ubuntu/
sudo apt-get update
sudo apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
 echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Docker Compose V2
# https://docs.docker.com/compose/cli-command/
COMPOSE_LOCATION=/usr/local/lib/docker/cli-plugins
mkdir -p $COMPOSE_LOCATION
curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $$COMPOSE_LOCATION/docker-compose
chmod +x $COMPOSE_LOCATION/docker-compose

# Compose switch
# Compose Switch is a replacement to the Compose V1 docker-compose (python) executable. Compose switch translates the command line into Compose V2 docker compose and then runs the latter.
curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh | sh

# Doppler
# https://docs.doppler.com/docs/install-cli
sudo apt-get update && sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | sudo apt-key add -
echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | sudo tee /etc/apt/sources.list.d/doppler-cli.list
sudo apt-get update && sudo apt-get install doppler

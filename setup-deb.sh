# Essentials
sudo apt install -y apt-transport-https ca-certificates curl gnupg

# 1Password + 1Password CLI
# https://support.1password.com/install-linux/
# https://developer.1password.com/docs/cli/get-started#install
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/$(dpkg --print-architecture) stable main" | sudo tee /etc/apt/sources.list.d/1password.list
sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
sudo apt update
sudo apt install -y 1password 1password-cli

# Tailscale
# https://tailscale.com/download
curl -fsSL https://tailscale.com/install.sh | sh

# Docker
# https://docs.docker.com/engine/install/ubuntu/
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu$(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io

# Docker Compose V2
# https://docs.docker.com/compose/cli-command/
COMPOSE_LOCATION=/usr/local/lib/docker/cli-plugins
sudo mkdir -p $COMPOSE_LOCATION
sudo curl -SL https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-linux-x86_64 -o $COMPOSE_LOCATION/docker-compose
sudo chmod +x $COMPOSE_LOCATION/docker-compose

# Compose switch
# Compose Switch is a replacement to the Compose V1 docker-compose (python) executable. Compose switch translates the command line into Compose V2 docker compose and then runs the latter.
curl -fL https://raw.githubusercontent.com/docker/compose-switch/master/install_on_linux.sh | sh

# Doppler
# https://docs.doppler.com/docs/install-cli
sudo apt update
curl -sLf --retry 3 --tlsv1.2 --proto "=https" 'https://packages.doppler.com/public/cli/gpg.DE2A7741A397C129.key' | sudo apt-key add -
echo "deb https://packages.doppler.com/public/cli/deb/debian any-version main" | sudo tee /etc/apt/sources.list.d/doppler-cli.list
sudo apt update
sudo apt install doppler

# SDKs

# Flutter
# https://docs.flutter.dev/get-started/install/linux
sudo snap install flutter --classic
flutter doctor

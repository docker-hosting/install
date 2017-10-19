# Webserver Structure

## Server Installation

On a fresh install of Fedora (version 25 or 26 tested), run the following commands to install the necessary software components:

```bash
# Install git
dnf install git

# Clone awesome mamiu/dotfiles and run installer
git clone https://github.com/mamiu/dotfiles
cd dotfiles/install
./install.sh
```

Then Log in again (with your newly created admin user).

```bash
# Configure and run docker
sudo systemctl start docker
sudo systemctl enable docker
sudo gpasswd -a <SERVER_USERNAME> docker
sudo systemctl restart docker
docker network create nginx-proxy
```

If you want to, you can install the ssh key on your Mac/Linux host to log in without password
```bash
# on your Mac / Linux host run
ssh-copy-id [youruser]@[yourfedorahost]
```

## Webserver structure

In order to run the web server you need to clone this repository into `/var/www`.
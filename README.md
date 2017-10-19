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

In order to run the web server you need to clone this repository into `/var/www`. You need to create a docker network with `docker network create nginx-proxy`.

### Restore backup
To restore a backup, edit the file `backup/backup.env` and insert your AWS credentials. Afterwards run `./backup/restore.sh` and all files will be restored from your AWS S3 Bucket.

### Creating backups
To create backups, you can edit the file `backup/backup.env` and change the `CRON_SCHEDULE` variable. Then run `./backup/start_sync.sh` and a docker container is started that will sync your `/var/www` with the declared AWS S3 Bucket.

### Host your sites from scratch
To start with a new server, you need two elementary docker-compose 'projects'. The first is [docker-hosting/nginx-proxy-template](https://github.com/docker-hosting/nginx-proxy-template), the second one is [docker-hosting/mail-forwarder-template](https://github.com/docker-hosting/mail-forwarder-template).

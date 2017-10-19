#!/bin/sh

docker run --rm -d --env-file backup.env -v /var/www:/data:ro dockerhosting/backup

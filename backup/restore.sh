#!/bin/sh

docker run --rm --env-file backup.env -v /var/www:/data:rw dockerhosting/backup get --skip-existing

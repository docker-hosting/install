#!/bin/sh

docker run --rm --env-file backup.env -v ${PWD}/..:/data:rw dockerhosting/backup get

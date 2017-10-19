#!/bin/sh

docker run --rm -d --env-file backup.env -v ${PWD}/..:/data:ro dockerhosting/backup

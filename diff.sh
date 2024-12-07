#!/usr/bin/env bash
# set -o xtrace
server=$1
path=$2
ssh root@${server} "cat /etc/nginx/${path}" | diff - ./${path}




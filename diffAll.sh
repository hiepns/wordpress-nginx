#!/usr/bin/env bash
# set -o xtrace
SERVERS=$(cat /Users/hiepns/cs/center/common/servers.txt)
path=$1
for SERVER in ${SERVERS[@]}; do
    echo -e "\n------------------ DIFF ${SERVER} ------------------\n"
    ssh root@${SERVER} "cat /etc/nginx/${path}" | diff - ./${path}
done




#!/usr/bin/env bash
# set -o xtrace


SERVERS=$(cat /Users/hiepns/cs/servers.txt)

for SERVER in ${SERVERS[@]}; do
    echo -e "\n------------------ SYNC to ${SERVER} ------------------\n"
#    scp conf.d/rate-limit.conf "$SERVER":/etc/nginx/conf.d/
    # scp globals/restrictions.conf "$SERVER":/etc/nginx/globals/
    scp conf.d/common.conf "$SERVER":/etc/nginx/conf.d/

    ssh "${SERVER}" << EOF
    echo -e "\n"
    hostname
    date
    nginx -t && nginx -s reload
    echo -e "\n"
EOF
done

#!/usr/bin/env bash
# set -o xtrace


SERVERS=$(cat /Users/hiepns/cs/center/common/servers.txt)

for SERVER in ${SERVERS[@]}; do
    echo -e "\n------------------ SYNC to ${SERVER} ------------------\n"
    # scp conf.d/rate-limit.conf "$SERVER":/etc/nginx/conf.d/
    scp globals/restrictions.conf "$SERVER":/etc/nginx/globals/
    # scp conf.d/common.conf "$SERVER":/etc/nginx/conf.d/
    # scp globals/hide-headers.conf "$SERVER":/etc/nginx/globals/
    # scp nginx.conf "$SERVER":/etc/nginx/nginx.conf
    # scp allowlist.conf "$SERVER":/etc/nginx/
    # scp sites-available/default.conf "$SERVER":/etc/nginx/sites-available/
    # scp errors/403.html "$SERVER":/etc/nginx/errors/
    # scp globals/restrictions.conf "$SERVER":/etc/nginx/globals/

    ssh "${SERVER}" << EOF
    echo -e "\n"
    hostname
    date
    # ln -sf /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled/
    nginx -t && nginx -s reload
    echo -e "\n"
EOF
done

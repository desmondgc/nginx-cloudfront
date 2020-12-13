#!/bin/sh

curl -s https://ip-ranges.amazonaws.com/ip-ranges.json |
jq -r '.prefixes[] | select(.service == "CLOUDFRONT") | .ip_prefix' |
awk '{ print "set_real_ip_from " $0 ";" }
END { print "real_ip_header X-Forwarded-For;" }
END { print "real_ip_recursive on;" }' > /etc/nginx/conf.d/cloudfront.conf

nginx -s reload
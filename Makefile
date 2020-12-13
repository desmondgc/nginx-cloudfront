.PHONY: check install

check:
	which jq > /dev/null
	nginx -V 2>&1 | grep -q with-http_realip_module

install: check cloudfront.sh
	install cloudfront.sh /etc/cron.daily/cloudfront
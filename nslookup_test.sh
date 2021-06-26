#!/bin/bash

# for debug only
# ./src/dnsmasq -d -C /tmp/dnsmasq_regex_example.conf -q

DIG="dig @localhost -p30000"
REDIR=/dev/null

echo 'UDP, server'
domains=("jd.com" "www.fb.me" "fb.me" "github.com" "www.github.com")
expect_dns=("114.114.114.114" "8.8.8.8" "8.8.8.8" "8.8.8.8" "8.8.8.8")
arraylength=${#domains[@]}
for (( i=0; i<${arraylength}; i++ ));do
	domain=${domains[$i]}
	echo "  $domain is forwared to ${expect_dns[$i]}"
	$DIG $domain > $REDIR
done

echo 'UDP, local'
domains=("qq.com" "www.qq.com" "localhost.com" "www.localhost.com")
expect_dns=("114.114.114.114" "local" "local" "local")
arraylength=${#domains[@]}
for (( i=0; i<${arraylength}; i++ ));do
	domain=${domains[$i]}
	echo "  $domain is forwared to ${expect_dns[$i]}"
	$DIG $domain > $REDIR
done

echo 'TCP, server'
domains=("2.taobao.com" "api.github.com")
expect_dns=("114.114.114.114" "8.8.8.8")
arraylength=${#domains[@]}
for (( i=0; i<${arraylength}; i++ ));do
	domain=${domains[$i]}
	echo "  $domain is forwared to ${expect_dns[$i]}"
	$DIG $domain +tcp > $REDIR
done

echo 'TCP, local'
domains=("q.com" "qzone.qq.com" "xxx.localhost.com")
expect_dns=("local" "local" "local")
arraylength=${#domains[@]}
for (( i=0; i<${arraylength}; i++ ));do
	domain=${domains[$i]}
	echo "  $domain is forwared to ${expect_dns[$i]}"
	$DIG $domain +tcp > $REDIR
done

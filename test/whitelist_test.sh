#!/bin/bash

# for debug only
# ./src/dnsmasq -d -C /tmp/whitelist_test.conf -q

DIG="dig @localhost -p30000 +retry=0"
REDIR=/dev/null

trap "exit" INT

function printExit()
{
	echo "Failed, exited"
	exit 1
}

echo 'UDP, server'
domains=("jd.com" "www.fb.me" "educause.edu" "www.msn.com" "msn.com" "www.google.com" "google.com")
expect_dns=("0.0.0.0" "0.0.0.0" "114.114.114.114" "1.1.1.1" "0.0.0.0" "114.114.114.114" "0.0.0.0")
arraylength=${#domains[@]}
for (( i=0; i<${arraylength}; i++ ));do
	domain=${domains[$i]}
	echo "  $domain is forwared to ${expect_dns[$i]}"
	$DIG $domain > $REDIR || printExit
done

echo 'TCP, server'
domains=("www.jd.com" "api.github.com" "berkeley.edu" "msnbc.msn.com" "msn.cn" "play.google.com" "google.cn")
expect_dns=("0.0.0.0" "0.0.0.0" "114.114.114.114" "1.1.1.1" "0.0.0.0" "114.114.114.114" "0.0.0.0")
arraylength=${#domains[@]}
for (( i=0; i<${arraylength}; i++ ));do
	domain=${domains[$i]}
	echo "  $domain is forwared to ${expect_dns[$i]}"
	$DIG $domain +tcp > $REDIR || printExit
done

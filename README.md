## dnsmasq with regex support

Lastest version: 2.80test2

patches:
- [001-regex-server.patch](/patches/001-regex-server.patch)
- [002-regex-ipset.patch](/patches/002-regex-ipset.patch)

Inspired by these repos:
- [dnsmasq-regexp_2.76](https://github.com/spacedingo/dnsmasq-regexp_2.76)
- [dnsmasq-regex](https://github.com/cuckoohello/dnsmasq-regex)

Original regex patch for dnsmasq 2.63
- [using regular expressions in server list](http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2013q2/007124.html)
- [dnsmasq-2.63-regex.patch](http://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/attachments/20130428/b3fc0de0/attachment.obj)

Offical dnsmasq:
- [dnsmasq](http://www.thekelleys.org.uk/dnsmasq/)

## Compile

For Debian/Ubuntu:

```
sudo apt install libpcre3-dev

git clone https://github.com/lixingcong/dnsmasq-regex

cd dnsmasq-regex

bash ./update_submodule.sh

make
```

## Config file example

[dnsmasq\_regex\_example.conf](/dnsmasq_regex_example.conf)

## Openwrt/LEDE package

Please check this page: [dnsmasq-regex-openwrt](https://github.com/lixingcong/dnsmasq-regex-openwrt)

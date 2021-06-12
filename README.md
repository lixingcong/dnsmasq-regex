## Dnsmasq with regex support

Lastest version: v2.86test1

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

## Prebuilt package

These packages were maintained by community. Build from source if your distribution was not in the list.

### Archlinux

	yay -S dnsmasq-regex

## Compile

For Debian/Ubuntu:

```
# Install libpcre3 and pkg-config
sudo apt install libpcre3-dev pkg-config

# Clone the repo
git clone https://github.com/lixingcong/dnsmasq-regex
cd dnsmasq-regex

# update the sub-module 'dnsmasq' to latest version
# only update when a newer version is released
bash ./update_submodule.sh

# build it
make

# Run the binary, check if the compile option contains "regex(+ipset)"
./dnsmasq/src/dnsmasq --version
```

*Tips:* If you do not need the patch of regex_ipset, just edit the file "Makefile" and build from source again.

Change this line

```
DNSMASQ_COPTS="-DHAVE_REGEX -DHAVE_REGEX_IPSET"
```

to

```
DNSMASQ_COPTS="-DHAVE_REGEX"
```

## Config file example

[dnsmasq\_regex\_example.conf](/dnsmasq_regex_example.conf)

Tips: A simple script to generate domains configurations: [my-gfwlist](https://github.com/lixingcong/my-gfwlist)

## OpenWrt/LEDE package

Please check this page: [dnsmasq-regex-openwrt](https://github.com/lixingcong/dnsmasq-regex-openwrt)

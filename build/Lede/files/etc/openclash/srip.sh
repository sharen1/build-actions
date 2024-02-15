#!/bin/sh
# 运营商分配IPv6 PD，需要注意自己是wan_6还是wan6，用ubus查看下
pd=$(ubus call network.interface.wan_6 status | grep  -A 3 '"ipv6-prefix":' | grep address | awk '{print $2}' | awk '{print substr($0,1,length($0)-4)}' | sed 's/^.//')
hz=:209:34ff:fe2c:5ab0 # 对应设备IPv6地址后缀部分（根据自己实际修改）
wanip6=${pd}${hz} # 拼接合成位对应设备IPv6地址
echo "${wanip6}"

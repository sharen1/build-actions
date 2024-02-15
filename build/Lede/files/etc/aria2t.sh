#!/bin/bash
wget https://raw.githubusercontent.com/XIU2/TrackersListCollection/master/best_aria2.txt -O /tmp/best_aria2.txt
[ -s /tmp/best_aria2.txt ] || exit 0 #必须加一个文件判断，不然有时候断网下载不成功会没有内容，导致下面也更新进去。
tmp=$(cat /tmp/best_aria2.txt)

uci set aria2.main.bt_tracker=$tmp
uci commit aria2
/etc/init.d/aria2 restart

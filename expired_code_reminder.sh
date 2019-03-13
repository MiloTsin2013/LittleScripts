#!/bin/bash

v_mine_user=`whoami`
source /home/$v_mine_user/.bash_profile
v_mine_ip=`/sbin/ifconfig |grep "inet addr:" | head -n 1 |awk -F ':' '{print $2}'|awk -F ' ' '{print $1}'`
v_expire_date=`chage -l "$v_mine_user" | head -n 4 | tail -n 1 | awk -F ':' '{print $2}'`
echo $v_mine_user
echo $v_expire_date
v_expire_s=`date +%s -d "$v_expire_date"`
v_curr_s=`date +%s`
v_expire_d=`echo "scale=0;($v_expire_s-$v_curr_s)/86400" | bc`
echo $v_expire_d
if [ 7 -gt $v_expire_d ]; then
	echo "expired!"
	# Send mail or other way to remind
else echo "yes"
fi

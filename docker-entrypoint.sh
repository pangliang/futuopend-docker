#!/bin/sh

FUTU_HOME=${FUTU_HOME:-"/FutuOpenD"}

console=${console:-0}
no_monitor=${no_monitor:-1}
cfg_file=${cfg_file:-"$FUTU_HOME/FutuOpenD.xml"}
lang=${lang:-chs}
api_ip=${api_ip:-0.0.0.0}
api_port=${api_port:-11111}
telnet_ip=${telnet_ip:-127.0.0.1}

OPTS="-console=$console -no_monitor=$no_monitor -cfg_file=$cfg_file -lang=$lang -log_level=$log_level"
OPTS="$OPTS -api_ip=$api_ip -api_port=$api_port -telnet_ip=$telnet_ip -telnet_port=$telnet_port -websocket_ip=$websocket_ip -websocket_port=$websocket_port"

if [ $login_account ];then
	OPTS="$OPTS -login_account=$login_account"
else
	echo "login_account IS NOT EXISTS"
    exit 100
fi

if [ $login_cert_file ];then
	OPTS="$OPTS -login_cert_file=$login_cert_file"
fi

if [ $login_cert_file ];then
	OPTS="$OPTS -login_region=$login_region"
fi

echo "Use Opts $OPTS"

if [ $login_pwd ];then
	OPTS="$OPTS -login_pwd=$login_pwd"
fi

if [ $login_pwd_md5 ];then
	OPTS="$OPTS -login_pwd_md5=$login_pwd_md5"
fi

if [ $login_pwd_md5 -a $login_pwd ];then
    echo "login_pwd IS NOT EXISTS"
    exit 100
fi

$FUTU_HOME/FutuOpenD $OPTS


#!/bin/bash
set -e
echo "####stop adminsetd service####"
service adminsetd stop
work_dir=/var/opt/adminset/client
rm -rf $work_dir
os=$(cat /proc/version)
if (echo $os|grep centos) || (echo $os|grep 'Red Hat')
then
    rm -f /usr/lib/systemd/system/adminsetd.service
    rm -f /etc/init.d/adminsetd
elif (echo $os|grep Ubuntu)
then
    rm -f /lib/systemd/system/adminsetd.service
else
    echo "your os version is not supported!"
fi
echo "####admiset agent uninstall finished!####"

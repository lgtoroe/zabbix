#!/bin/bash

######################################################### 
# Install Agent Zabbix for Linux Server					#
#########################################################

ZABBIX_OLD=/etc/zabbix/old
ZABBIX_NEW=/etc/zabbix/

# Verify the distro and install the zabbix agent package

if [ -f /etc/redhat-release ]; then
	sudo yum install zabbix-agent -y
fi

if [ -f /etc/lsb-release ]; then
	sudo apt-get install zabbix-agent -y
fi

# Perform the Zabbix agent configuration process

mkdir /etc/zabbix/old
mv /etc/zabbix/zabbix_agent*.conf /etc/agent/old
# We can put a IF sentence for %1 execute differents profiles example K8s .... 
# if [ %1 == K8s ]; then 
#	wget -o  /etc/zabbix/zabbix_agentd.conf http://site/zabbix_agentd.K8s.conf
####	mv zabbix_agentd.K8s.conf /etc/zabbix/zabbix_agentd.conf
# else
#	wget -o /etc/zabbix/zabbix_agentd.conf http://site/zabbix_agentd.K8s.conf
# fi

service zabbix-agent restart
sudo chmod 755 /etc/init.d/zabbix-agent
sudo update-rc.d zabbix-agent defaults
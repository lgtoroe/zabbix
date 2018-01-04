#!/bin/bash
profile=$1

######################################################### 
# Install Agent Zabbix for Linux Server					#
#########################################################

ZABBIX_OLD=/etc/zabbix/old
ZABBIX_NEW=/etc/zabbix/

# Check if agent is installed, then do nothing !!!!! 
# Status: Pending 



#Verified user is ROOT

if [ "$(whoami)" != 'root' ]; then
        echo "You have no permission to run $0 as non-root user."
        exit 1;
fi

# Verify the distro and install the zabbix agent package

if [ -f /etc/redhat-release ]; then
	sudo yum install zabbix-agent -y
fi

if [ -f /etc/lsb-release ]; then
	sudo apt-get install zabbix-agent -y
fi

# Perform the Zabbix agent configuration process

if [ ! -d /etc/zabbix/old ]; then
	mkdir /etc/zabbix/old
fi

if [ -f /etc/zabbix/zabbix_agent*.conf ]; then 
	mv /etc/zabbix/zabbix_agent*.conf /etc/zabbix/old
fi

# We can put a IF sentence for %1 execute differents profiles example K8s .... 
if [[ -n "$profile" ]]; then 
	if [ "$profile" == "K8s" ]; then 
		wget -o  /etc/zabbix/zabbix_agentd.conf https://raw.githubusercontent.com/lgtoroe/zabbix/master/zabbix_agentd.K8s.conf
	####	mv zabbix_agentd.K8s.conf /etc/zabbix/zabbix_agentd.conf  <-- Remove ... move into wget
else
	wget -O /etc/zabbix/zabbix_agentd.conf https://raw.githubusercontent.com/lgtoroe/zabbix/master/zabbix_agentd.conf
fi

service zabbix-agent restart
sudo chmod 755 /etc/init.d/zabbix-agent
sudo update-rc.d zabbix-agent defaults

exit
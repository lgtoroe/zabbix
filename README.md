# zabbix

Repo for Zabbix installer Server and Agent scripts/YAML for K8s Deploy for Server, and Ubuntu install agent.

#Usage

Execute Agent in Ubuntu 16.04 LTS (First commit ... after multiplattforms)

bash <(https://raw.githubusercontent.com/lgtoroe/zabbix/master/zabbix-agent-installer.sh)

or

curl https://raw.githubusercontent.com/lgtoroe/zabbix/master/zabbix-agent-installer.sh | bash -s profile

Profile:
	K8s:	Profile for agent on server deploy in Kubernetes (K8s)

# For execute SH from linux, before install curl examples

bash <(curl -s http://mywebsite.com/myscript.txt)

curl http://foo.com/script.sh | bash -s arg1 arg2




Best Regards.
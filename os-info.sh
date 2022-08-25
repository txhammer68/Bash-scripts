RELEASE=`lsb_release -r | tr '\n' ' '| tr '\t' ' ' | cut -c 9- | sed 's/[ \t]*$//'` >/dev/null
CODE=`lsb_release -c | tr '\n' ' '| tr '\t' ' ' | cut -c 10- | sed 's/[ \t]*$//'`>/dev/null
DISTRO=`lsb_release -d | tr '\n' ' '| tr '\t' ' ' | cut -c 14- | sed 's/[ \t]*$//'`>/dev/null
KERNEL=`uname -r` >/dev/null
SDATEST=`smartctl -H /dev/sda` > /dev/null
SDBTEST=`smartctl -H /dev/sdb` > /dev/null
SDCTEST=`smartctl -H /dev/sdc` > /dev/null
SDATEST=`echo $SDATEST | awk '{print $NF}'` > /dev/null
SDBTEST=`echo $SDBTEST | awk '{print $NF}'` > /dev/null
SDCTEST=`echo $SDCTEST | awk '{print $NF}'` > /dev/null
HOSTNAME=`cat \/etc\/hostname` >/dev/null
FIREWALL=`systemctl is-active iptables` >/dev/null
EXTIP=`curl -s ipecho.net/plain` >/dev/null
INTIP=`ip -4 addr show eno1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'` >/dev/null
FIREWALL=`systemctl is-active iptables` >/dev/null
EXTIP=`curl -s ipecho.net/plain` >/dev/null
INTIP=`ip -4 addr show eno1 | grep -oP '(?<=inet\s)\d+(\.\d+){3}'` >/dev/null
echo "{\"hostname\":\"$HOSTNAME\",\"extip\":\"$EXTIP\",\"intip\":\"$INTIP\",\"distro\":\"$DISTRO\",\"code\":\"$CODE\",\"firewall\":\"$FIREWALL\",\"release\":\"$RELEASE\",\"kernel\":\"$KERNEL\",\"sda\":\"$SDATEST\",\"sdb\":\"$SDBTEST\",\"sdc\":\"$SDCTEST\"}" > /tmp/osInfo.json



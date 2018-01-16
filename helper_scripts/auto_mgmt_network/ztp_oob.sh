#!/bin/bash
# Created by Topology-Converter v4.6.5
#    Template Revision: v4.6.5

function error() {
  echo -e "\e[0;33mERROR: The Zero Touch Provisioning script failed while running the command $BASH_COMMAND at line $BASH_LINENO.\e[0m" >&2
}
trap error ERR

echo "deb http://apps3.cumulusnetworks.com/repos/deb CumulusLinux-3 netq-1.2" >> /etc/apt/sources.list
apt-get -y update
apt-get -y install cumulus-netq
SSH_URL="http://192.168.255.254/authorized_keys"
#Setup SSH key authentication for Ansible
mkdir -p /home/cumulus/.ssh
wget -O /home/cumulus/.ssh/authorized_keys $SSH_URL

echo "cumulus ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/10_cumulus

reboot
exit 0
#CUMULUS-AUTOPROVISIONING

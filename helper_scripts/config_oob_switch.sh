#!/bin/bash

echo "#################################"
echo "   Running config_oob_switch.sh"
echo "#################################"
sudo su

copy /home/vagrant/bridge-untagged /etc/network/interfaces
ifreload -a

echo "#################################"
echo "   Finished "
echo "#################################"


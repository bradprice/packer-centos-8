#!/usr/bin/env bash

echo -e "Updating All Packages"
/usr/bin/yum upgrade -y -q

echo -e "Installing Python PIP"
dnf install -y -q python3-pip

echo -e "Installing Ansible"
#/bin/pip3 install ansible > /dev/null 2>&1
/bin/pip3 install -q ansible

exit 0
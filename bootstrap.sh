#!/usr/bin/env bash

cd /home/vagrant

yum update
yum install -y vim
yum clean all

if [ $(hostname) == "puppet-master" ]; then
  #yum install -y epel-release
  #yum install -y ansible
fi

#!/bin/bash
LOG=/var/log/boot.log
if [ -f /etc/redhat-release ]; then
  yum update -y > $LOG
  yum install vim net-tools curl wget -y >> $LOG
  yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm >> $LOG
  sleep 1
  systemctl enable amazon-ssm-agent
  systemctl start amazon-ssm-agent 
fi

if [ -f /etc/lsb-release ]; then
  apt-get update
fi
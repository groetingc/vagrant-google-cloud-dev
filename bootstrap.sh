#!/usr/bin/env bash

# bootstrapping salt-minion
if [ ! -x /usr/bin/salt-minion ]; then
  wget -O install_salt.sh https://bootstrap.saltstack.com
  #-> master sudo sh install_salt.sh -M -N
  sh install_salt.sh
  rm install_salt.sh
  #remove saltstack ppa entry again
  sudo apt-get-repository --remove ppa:saltstack/salt
else
  echo "Provisioning: salt-minion already installed...skipping!"
fi



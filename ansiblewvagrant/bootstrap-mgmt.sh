#!/usr/bin/env bash
#the shebang above is more portable than /bin/bash since you don't know if that will be teh location of bash on all machines

#install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update #update the package cache
apt-get -y install ansible

#copy examples into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/examples/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

chmod 664 /home/vagrant/*.yml
chmod 664 /home/vagrant/*.cfb
chmod 664 /home/vagrant/*.ini
#configure hosts file for our internal network defined by Vagrantfile

cat >> /etc/hosts <<EOF

#vagrant environment nodes
10.0.15.10  mgmt
10.0.15.11  lb
10.0.15.21  web1
10.0.15.22  web2
10.0.15.23  web3
10.0.15.24  web4
10.0.15.25  web5
10.0.15.26  web6
10.0.15.27  web7
10.0.15.28  web8
10.0.15.29  web9
EOF

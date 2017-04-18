#!/bin/bash

grep -q -F '192.168.10.101 puppet-server' /etc/hosts || echo '192.168.100.101 puppet puppet-server puppet-server.epbyminw2473.minsk.epam.com' >> /etc/hosts
grep -q -F '192.168.10.102 puppet-node1' /etc/hosts || echo '192.168.100.102 puppet-node1 puppet-node1.epbyminw2473.minsk.epam.com' >> /etc/hosts

yum install -y epel-release > /dev/null 2>&1
yum localinstall -y http://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm > /dev/null 2>&1
yum install -y puppetserver > /dev/null 2>&1

/bin/cp /vagrant/puppet/autosign.conf /etc/puppetlabs/puppet   
mkdir -p /etc/puppetlabs/code/environments/production/modules
/bin/cp -R /vagrant/puppet/modules/* /etc/puppetlabs/code/environments/production/modules
chmod -R 0777 /etc/puppetlabs/code/environments/production/modules
/bin/cp /vagrant/puppet/site.pp /etc/puppetlabs/code/environments/production/manifests

systemctl enable puppetserver
systemctl restart puppetserver

echo '0'
exit 0

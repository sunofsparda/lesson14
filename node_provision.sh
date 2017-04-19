#!/bin/bash

grep -q -F '192.168.10.101 puppet-server puppet-server.2473' /etc/hosts || echo '192.168.10.101 puppet puppet-server puppet-server.2473' >> /etc/hosts
grep -q -F '192.168.10.102 puppet-node1 puppet-node1.2473' /etc/hosts || echo '192.168.10.102 puppet-node1 puppet-node1.2473' >> /etc/hosts

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet-agent wget unzip

/bin/cp /vagrant/puppet/puppet.conf /etc/puppetlabs/puppet/puppet.conf
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

PATH=/opt/puppetlabs/bin:$PATH;export PATH
puppet agent -t --verbose --debug

echo 'provisioned'
exit 0

#!/bin/bash

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet-agent

grep -q -F '192.168.10.101 puppet-server' /etc/hosts || echo '192.168.100.101 puppet-server puppet-server.epbyminw2473.minsk.epam.com' >> /etc/hosts
grep -q -F '192.168.10.102 puppet-node1' /etc/hosts || echo '192.168.100.102 puppet-node1 puppet-node1.epbyminw2473.minsk.epam.com' >> /etc/hosts

/bin/cp /vagrant/puppet/puppet.conf /etc/puppetlabs/puppet/puppet.conf
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true


PATH=/opt/puppetlabs/bin:$PATH;export PATH
puppet agent -t --verbose --debug

echo 'provisioned'
exit 0

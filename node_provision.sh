#!/bin/bash


rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet-agent

echo "server = puppet-server.epbyminw2473.minsk.epam.com" >> /etc/puppetlabs/puppet/puppet.conf
grep -q -F '192.168.10.101 puppet-server' /etc/hosts || echo '192.168.100.101 puppet-server.epbyminw2473.minsk.epam.com' >> /etc/hosts
grep -q -F '192.168.10.102 puppet-node1' /etc/hosts || echo '192.168.100.102 puppet-node1.epbyminw2473.minsk.epam.com' >> /etc/hosts


/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

puppet agent -t --verbose --debug

echo '0'
exit 0

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppet-agent
systemctl restart network
echo "server = puppet-server.epbyminw2473.minsk.epam.com" >> /etc/puppetlabs/puppet/puppet.conf
echo "192.168.10.101 puppet-server.epbyminw2473.minsk.epam.com" >> /etc/hosts
/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true

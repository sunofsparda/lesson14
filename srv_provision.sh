rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppetserver
systemctl restart network
cp /vagrant/puppet/autosign.conf /etc/puppetlabs/puppet   
systemctl start puppetserver
source ~/.bashrc
mkdir -p /etc/puppetlabs/code/environments/production/modules
cp -R /vagrant/puppet/modules/* /etc/puppetlabs/code/environments/production/modules
chmod -R 0777 /etc/puppetlabs/code/environments/production/modules/jboss/files
cp /vagrant/puppet/site.pp /etc/puppetlabs/code/environments/production/manifests

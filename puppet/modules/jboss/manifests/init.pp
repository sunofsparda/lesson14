 
class jboss{

  $servicename = 'jboss'
  $jboss_home = '/opt/jboss-as-7.1.1'
  $java_version = '1.7.0'


  package { 'java':
    name => "java-$java_version-openjdk",
    ensure => installed,
    }

  file { $jboss_home:
      ensure  => directory,
      source  => 'puppet:///modules/jboss/jboss-as-7.1.1',
      path    => $jboss_home,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      recurse => 'remote',
      require => Package['java']
      }
      
  file { '/etc/init.d/jboss':
	content => template('jboss/jboss-init.sh.erb'),
	owner   => root,
	group   => root,
	mode    => '0755',
	ensure => file,
	notify  => Service[$servicename]
	}
	
  service { $servicename:
      ensure => 'running',
      enable => true,
      require => Exec['Register_init']
    }

  exec { 'Register_init':
      command => "chkconfig --add /etc/init.d/jboss",
      path => ['/usr/bin', '/usr/sbin',],
  }
      
}

class deploy{

  $app_url = "http://www.cumulogic.com/download/Apps/testweb.zip" 
  $app_file = "/opt/jboss-as-7.1.1/standalone/deployments/testweb.zip"
  $app_folder = "/opt/jboss-as-7.1.1/standalone/deployments/"

  package { 'unzip':
    ensure => installed,
    }

  file { $app_file:
      ensure  => file,
      source  => $app_url,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      }

  exec {'unzip':
      command => "unzip -j ${app_file} -d ${app_folder}",
      path => ['/usr/bin', '/usr/sbin',],
      creates => "${app_folder}/testweb.war",
	}
}
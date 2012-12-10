#NGINX
package { 'nginx':
  ensure => present,
# before => File['/etc/ssh/sshd_config'],
}

service { 'nginx':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
# subscribe  => File['/etc/nginx/nginx.conf'],
}

#JAVA OPENJDK
openjdk-7-jdk
package { 'tomcat7':
  ensure => present,
}

#TOMCAT
package { 'tomcat7':
  ensure => present,
# before => File['/etc/tomcat7/'],
}

service { 'tomcat7':
  ensure     => running,
  enable     => true,
  hasrestart => true,
  hasstatus  => true,
# subscribe  => File['/etc/tomcat7/'],
}

#RELATIONSHIP CHAINS/ORDERING
package['openjdk-7-jdk'] -> package['tomcat7']

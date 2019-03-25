class remove_package {

  package { 'httpd':
    ensure => 'absent',
  }

  package { 'httpd':
    ensure => 'purged',
  }

}
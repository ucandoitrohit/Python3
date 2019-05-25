class packages {

  package { 'httpd': ensure => 'installed' }
  package { 'vim': ensure => 'installed' }
  package { 'ngnix':   ensure => 'installed' }

  Package { ensure => 'installed' }

  package { 'httpd': }
  package { 'vim': }
  package { 'ngnix':   }

  $list_packages = [ 'vim', 'httpd', 'ngnix' ]
  package { $list_packages: ensure => 'installed' }

  Package { ensure => 'installed' }

  $list_packages = [ 'vim', 'httpd', 'ngnix' ]

  package { $list_packages: }

}
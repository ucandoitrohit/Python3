class directory {

  file { '/home/rohit/puppet_dir':
    ensure => 'directory',
  }

  file { '/home/rohit/puppet_dir':
    ensure => 'directory',
    owner  => 'root',
    group  => 'wheel',
    mode   => '0750',
  }

}
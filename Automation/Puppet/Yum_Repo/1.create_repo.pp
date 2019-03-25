class yum_repo {

  yumrepo { 'own_repo':
    name => local
    descr    => 'Local repo for packages',
    baseurl  => 'http://www.example.com/rhel',
    gpgcheck => 0,
    enabled  => 1,
  }

}
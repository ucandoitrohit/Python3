class remove_yum_repo {

  yumrepo { 'own_repo':
    gpgcheck => 'absent',
  }

}
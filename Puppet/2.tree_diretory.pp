class tree_directory {

  file { [  '/home/rohit/new_dir/', '/home/rohit/new_dir/New1',
            '/home/rohit/new_dir/New1/New1.1', '/home/rohit/new_dir/New1/New2' ]:
    ensure => 'directory',
  }

  $var_dirs = [  '/home/rohit/new_dir/', '/home/rohit/new_dir/New1',
            '/home/rohit/new_dir/New1/New1.1', '/home/rohit/new_dir/New1/New2' 
            ]


  file { $var_dirs:
    ensure => 'directory',
    owner  => 'root',
    group  => 'wheel',
    mode   => '0750',
  }

}
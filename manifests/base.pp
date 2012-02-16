class abrt::base {

  package{'abrt':
    ensure => present,
  }

  service{['abrtd','abrt-oops','abrt-ccpp']:
    ensure => running,
    enable => true,
    require => Package['abrt'],
  }

}

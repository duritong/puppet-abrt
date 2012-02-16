class abrt::disable::base inherits abrt::base {

  Package['abrt']{
    ensure => absent,
    require => Service['abrtd','abrt-oops','abrt-ccpp'],
  }

  Service['abrtd','abrt-oops','abrt-ccpp']{
    ensure => stopped,
    enable => false,
    require => undef,
  }
}

class abrt::disable::base inherits abrt::base {
  package{
    'abrt-cli':
      ensure => absent;
    ['abrt-addon-kerneloops','abrt-addon-ccpp','abrt-addon-python']:
      require => Package['abrt-cli'],
      ensure => absent;
  }

  Package['abrt']{
    ensure => absent,
    require => [Service['abrtd','abrt-oops','abrt-ccpp'], Package['abrt-addon-kerneloops','abrt-addon-ccpp','abrt-addon-python']],
  }

  Service['abrtd','abrt-oops','abrt-ccpp']{
    ensure => stopped,
    enable => false,
    require => undef,
  }
}

# remove all the necessary packages
class abrt::disable::base inherits abrt::base {
  Package['abrt-cli']{
    ensure => absent,
    before => Service['abrtd','abrt-oops','abrt-ccpp']
  }
  Service['abrtd','abrt-oops','abrt-ccpp']{
    ensure => stopped,
    enable => false,
    require => undef
  }
  package{
    ['abrt-addon-kerneloops','abrt-addon-ccpp',
      'abrt-addon-python','abrt','abrt-python']:
      ensure  => absent,
      require => Service['abrtd','abrt-oops','abrt-ccpp'];
  }
  Package['abrt-python'] -> Package['abrt']
}

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
  exec{'yum remove abrt -y':
    onlyif  => 'rpm -qi abrt',
    require => Service['abrtd','abrt-oops','abrt-ccpp'];
  }
}

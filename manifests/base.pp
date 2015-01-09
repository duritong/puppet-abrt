# base tools
class abrt::base {

  package{'abrt-cli':
    ensure => present,
  } -> service{['abrtd','abrt-oops','abrt-ccpp']:
    ensure  => running,
    enable  => true,
  }

}

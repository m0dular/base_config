class base_config::base_packages (
  Array[String] $packages,
){
  if $facts['os']['family'] == 'RedHat' {
    # TODO: yum resource?
    exec {'epel':
      command => 'yum -y install epel-release',
      path    => ['/bin'],
      creates => '/etc/yum.repos.d/epel.repo',
    }
    package { $packages:
      ensure  => latest,
      require => Exec['epel'],
    }
  }
  else {
    package { $packages:
      ensure  => latest,
    }
  }
}

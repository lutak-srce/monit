class monit::package inherits monit {

  if $monit::package_manage {

    package { $monit::package_name:
      ensure => $monit::package_ensure,
    }
  }

}

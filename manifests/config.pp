class monit::config  inherits monit {

  file { $monit::monitconfd_dir:
    ensure  => directory,
    recurse => true,
    purge   => true,
  }

  file { $monit::monitrc_file:
    ensure  => file,
    content => epp($monit::monitrc_epp),
    owner   => $monit::file_owner,
    group   => $monit::file_group,
    mode    => $monit::monitrc_mode,
  }

  file { $monit::rootbin_file:
    ensure => file,
    source => $monit::rootbin_src,
    owner  => $monit::file_owner,
    group  => $monit::file_group,
    mode   => $monit::file_mode,
  }

  file { $monit::rootrc_file:
    ensure => file,
    source => $monit::rootrc_src,
    owner  => $monit::file_owner,
    group  => $monit::file_group,
    mode   => $monit::file_mode,
  }

  file { $monit::rootstrict_file:
    ensure => file,
    source => $monit::rootstricet_src,
    owner  => $monit::file_owner,
    group  => $monit::file_group,
    mode   => $monit::file_mode,
  }

  $monit::services_managed.each |$manage| {
    monit::services { $manage: }
  }

}

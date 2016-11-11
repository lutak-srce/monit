define monit::services {

  file { "${monit::monitrcd_dir}${title}":
    ensure  => file,
    content => epp("monit/${title}"),
    owner   => $monit::file_owner,
    group   => $monit::file_group,
    mode    => $monit::file_mode,
  }

  file { "${monit::monitconfd_dir}${title}":
    ensure => link,
    target => "${monit::monitrcd_dir}${title}",
  }

}

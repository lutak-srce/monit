class monit::service inherits monit {

  if ! ($monit::service_ensure in [ 'running', 'stopped' ]) {
    fail('service_ensure parameter must be running or stopped')
  }

  if $monit::service_manage == true {
    service { 'monit':
      ensure     => $monit::service_ensure,
      enable     => $monit::service_enable,
      name       => $monit::service_name,
      provider   => $monit::service_provider,
      hasstatus  => true,
      hasrestart => true,
    }
  }

}

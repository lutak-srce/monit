class monit (
  Boolean              $package_manage,
  Boolean              $syslog,
  Integer              $check_interval,
  Optional[Integer]    $start_delay,
  Optional[String]     $mailserver,
  Optional[String]     $alert_recipient,
  Optional[Boolean]    $alert_root,
  String               $package_ensure,
  String               $package_name,
  Stdlib::Absolutepath $monitrc_file,
  Stdlib::Absolutepath $monitrcd_dir,
  Stdlib::Absolutepath $confd_dir,
  Stdlib::Absolutepath $rootbin_file,
  Stdlib::Absolutepath $rootrc_file,
  Stdlib::Absolutepath $rootstrict_file,
  String               $rootbin_src,
  String               $rootrc_src,
  String               $rootstrict_src,
  String               $monitrc_epp,
  String               $file_owner,
  String               $file_group,
  String               $file_mode,
  String               $monitrc_mode,
  Optional[Integer]    $port,
  Array                $noalert,
  Array                $allow,
  Boolean              $service_enable,
  String               $service_ensure,
  Boolean              $service_manage,
  String               $service_name,
  Optional[String]     $service_provider,
  Array[String]        $services_managed,
  Optional[Integer]    $apache_port,
  Optional[String]     $apache_ip,
) {

    contain monit::package
    contain monit::config
    contain monit::service

    Class['::monit::package'] ->
    Class['::monit::config'] ~>
    Class['::monit::service']

}

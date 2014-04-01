class lightdm {
  include lightdm::install, lightdm::config, lightdm::service

  Class['lightdm::install'] -> Class['lightdm::config'] ~> Class['lightdm::service']
}

class lightdm::service {
  service {'lightdm':
    ensure => 'running',
    enable => 'true',
  }
}

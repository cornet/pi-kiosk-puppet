class lightdm::config {
  file {'/etc/lightdm/lightdm.conf':
    ensure => 'present',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => 'puppet:///modules/lightdm/lightdm.conf',
  }
}

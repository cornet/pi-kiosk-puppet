class kiosk::config ($url = 'http://www.bbc.co.uk/news/') {
  file {'/etc/xdg/lxsession/LXDE/autostart':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('kiosk/lxde-autostart.erb'),
    notify  => Class['lightdm::service'],
  }

  file {['/home/pi/.config', '/home/pi/.config/openbox']:
    ensure => 'directory',
    owner  => 'pi',
    group  => 'pi',
    mode   => '0755',
  }

  file {'/home/pi/.config/openbox/lxde-rc.xml':
    owner  => 'pi',
    group  => 'pi',
    mode   => '0644',
    source => 'puppet:///modules/kiosk/lxde-rc.xml',
  }
}

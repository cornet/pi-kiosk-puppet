class kiosk::install {
  $packages = [
    'uzbl',
    'x11-xserver-utils',
    'ttf-mscorefonts-installer',
    'unclutter',
    # Required for ruby-wmctrl
    'libx11-dev','libglib2.0-dev','libxmu-dev'
  ]

  package {$packages:
    ensure => 'installed',
    notify => Class['lightdm::service'],
  }

  package {'ruby-wmctrl':
    ensure   => '0.0.6',
    provider => 'gem',
    require  => Package['libx11-dev','libglib2.0-dev','libxmu-dev'],
  }
}

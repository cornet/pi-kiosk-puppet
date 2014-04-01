class kiosk {
  include kiosk::install, kiosk::config

  Class['kiosk::install'] -> Class['kiosk::config']
}

# Shadow-Soft NTP Installation Manifest
#
class ntp::install {
  package {'ntp':
    ensure => 'present',
  }
}
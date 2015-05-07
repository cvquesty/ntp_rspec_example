# Shadow-Soft NTP Configuration Manifest
#
class ntp::config {
  file { '/etc/ntp.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/ntp/etc_ntp.conf',
    require => Class['ntp::install'],
    notify  => Class['ntp::service'],
  }

  file { '/etc/ntp/step-tickers':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/ntp/etc_ntp_step-tickers',
    require => Class['ntp::install'],
    notify  => Class['ntp::service'],
  }
}
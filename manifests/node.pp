# Class munin::node
#
# Usage:
#
#  class { 'munin::node':
#    allowed_ips    => [ '192.168.1.10', '192.168.1.20', ],
#    listen_port    => '4949',
#    listen_address => '*',
#    ensure_service => running,
#    enable_service => true,
#
#  }

class munin::node (
    $listen_address = '*',
    $listen_port    = '4949',
    $ignore_files   = [],
    $allowed_ips    = [],
    $ensure_service = running,
    $enable_service = true,
) {

  case $::operatingsystem {
    centos, redhat, amazon: {
      $log_dir      = '/var/log/munin-node'
      $cidr_package = 'perl-Net-CIDR'
    }
    debian, ubuntu: {
      $log_dir      = '/var/log/munin'
      $cidr_package = 'libnet-cidr-perl'
    }
    default: { fail ("Error: Unrecognized operating system = ${::operatingsystem}") }
  }

  package { $cidr_package:
    ensure => installed,
  }

  package { 'munin-node':
    ensure  => installed,
    require => Package[$cidr_package],
  }

  service { 'munin-node':
    ensure     => $ensure_service,
    enable     => $enable_service,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['munin-node'],
  }

  file { 'munin-node.conf':
    ensure    => file,
    owner     => root,
    group     => root,
    mode      => '0644',
    path      => '/etc/munin/munin-node.conf',
    content   => template('munin/munin-node.conf.erb'),
    require   => Package['munin-node'],
    notify    => Service['munin-node'],
  }

}

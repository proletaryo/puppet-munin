# Class munin::node
#
# Usage:
#
# class { 'munin::node' :
#   allowed_ips = [ '192.168.1.56', '10.10.10.78', ],
#   ensure      = running,
#   enable      = true,
# }
#
# TODO:
# - how about plugins, how to disable/enable?

class munin::node (
    $listen_address = '*',
    $listen_port    = '4949',
    $ignore_files   = [],
    $allowed_ips    = [],
    $ensure_service = running,
    $enable_service = true,
) {

  # use $::osfamily instead??
  case $::operatingsystem {
    centos, redhat, amazon: {
      $cidr_package = 'perl-Net-CIDR'
      $log_dir = '/var/log/munin-node'
    }
    debian, ubuntu: {
      $cidr_package = 'libnet-cidr-perl'
      $log_dir = '/var/log/munin'
    }
    default: { fail ("Error: Unrecognized operating system = ${::operatingsystem}") }
  }

  package { $cidr_package:
    ensure => installed,
  }

  package { 'munin-node':
    ensure => installed,
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

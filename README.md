# puppet-munin

This puppet module automates installation/management of the munin-node package

## TODOs
  * support for munin package
  * enable/disable plugins

## Parameters
  * `listen_address`: default='*'
  * `listen_port`:    default='4949'
  * `ignore_files`:   default=[]
  * `allowed_ips`:    default=[]
  * `ensure_service`: default=running
  * `enable_service`: default=true

## Usage

    class { 'munin::node':
      allowed_ips    => [ '192.168.1.10', '192.168.1.20', ],
      listen_port    => '4949',
      listen_address => '*',
      ensure_service => running,
      enable_service => true,
    
    }

## Dependencies

None

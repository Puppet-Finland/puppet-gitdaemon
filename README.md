# puppet-gitdaemon

A Puppet module for managing git-daemon. Install, service and packetfilter are 
supported. On Debian basic git-daemon configuration is also supported via 
/etc/default/git-daemon.

# Module usage

Example usage from a profile:

    class { '::gitdaemon':
        directory          => '/var/lib/repos',
        allow_ipv4_address => lookup('intranet'),
    }
    
    # allow git-daemon to export a repository
    file { '/var/lib/repos/myrepo.git/git-daemon-export-ok':
        ensure => 'present',
    }

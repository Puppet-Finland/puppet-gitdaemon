# == Class: gitdaemon::config
#
# This class configures git-daemon
#
class gitdaemon::config
(
    $base_path,
    $directory

) inherits gitdaemon::params

{
    if $::osfamily == 'Debian' {
        class { '::gitdaemon::config::debian':
            base_path => $base_path,
            directory => $directory,
        }
    }
}

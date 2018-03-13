# == Class: gitdaemon::install
#
# This class installs gitdaemon
#
class gitdaemon::install inherits gitdaemon::params
{
    package { $::gitdaemon::params::package_name:
        ensure => 'present',
    }
}

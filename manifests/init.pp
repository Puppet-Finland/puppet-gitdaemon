# == Class: gitdaemon
#
# This class sets up gitdaemon
#
# Currently functionality is limited to installing or removing the package.
#
# == Parameters
#
# [*manage*]
#   Whether to manage gitdaemon using Puppet. Valid values are true (default) 
#   and false.
# [*ensure*]
#   Status of gitdaemon. Valid values are 'present' (default) and 'absent'.
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-license. See file LICENSE for details.
#
class gitdaemon
(
    Boolean                  $manage = true,
    Enum['present','absent'] $ensure = 'present'

) inherits gitdaemon::params
{

if $manage {
    class { '::gitdaemon::install':
        ensure => $ensure,
    }
}
}

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
# [*manage_config*]
#   Whether to manage the system service using Puppet. Valid values are true 
#   (default) and false.
# [*manage_packetfilter*]
#   Whether to manage the packet filtering using Puppet. Valid values are true 
#   (default) and false.
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
    Boolean $manage = true,
    Boolean $manage_config = true,
    Boolean $manage_packetfilter = true,
    String  $allow_ipv4_address = '127.0.0.1',
    String  $allow_ipv6_address = '::1'

) inherits gitdaemon::params
{

if $manage {
    include ::gitdaemon::install

    # UNIMPLEMENTED
    #if $manage_config {
    #    class { '::gitdaemon::config':
    #    }
    #}

    include ::gitdaemon::service

    if $manage_packetfilter {
        class { '::gitdaemon::packetfilter':
            allow_ipv4_address => $allow_ipv4_address,
            allow_ipv6_address => $allow_ipv6_address,
        }
    }
}
}

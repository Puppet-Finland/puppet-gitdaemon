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
# [*base_path*]
#   Base path for git-daemon. On Debian this defaults to '/var/lib'.
# [*directory*]
#   Directory where Git repositories served by git-daemon are located. On Debian 
#   this defaults to '/var/lib/git'.
# [*allow_ipv4_address*]
#   IPv4 address or subnet from which to allow access. Defaults to '127.0.0.1'.
# [*allow_ipv6_address*]
#   IPv6 address or subnet from which to allow access. Defaults to '::1'.

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
    String  $base_path = $::gitdaemon::params::base_path,
    String  $directory = $::gitdaemon::params::directory,
    String  $allow_ipv4_address = '127.0.0.1',
    String  $allow_ipv6_address = '::1'

) inherits gitdaemon::params
{

if $manage {
    include ::gitdaemon::install

    if $manage_config {
        class { '::gitdaemon::config':
            base_path => $base_path,
            directory => $directory,
        }
    }

    include ::gitdaemon::service

    if $manage_packetfilter {
        class { '::gitdaemon::packetfilter':
            allow_ipv4_address => $allow_ipv4_address,
            allow_ipv6_address => $allow_ipv6_address,
        }
    }
}
}

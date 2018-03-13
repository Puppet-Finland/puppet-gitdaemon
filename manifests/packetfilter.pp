#
class gitdaemon::packetfilter
(
    $allow_ipv4_address,
    $allow_ipv6_address

) inherits gitdaemon::params
{

    $source_v4 = $allow_ipv4_address ? {
        'any'   => undef,
        default => $allow_ipv4_address,
    }

    $source_v6 = $allow_ipv6_address ? {
        'any'   => undef,
        default => $allow_ipv6_address,
    }

    Firewall {
        chain    => 'INPUT',
        proto    => 'tcp',
        dport    => 9418,
        action   => 'accept'
    }

    # IPv4 rules
    firewall { '013 ipv4 accept gitdaemon port':
        provider => 'iptables',
        source   => $source_v4,
    }

    # IPv6 rules
    firewall { '013 ipv6 accept gitdaemon port':
        provider => 'ip6tables',
        source   => $source_v6,
    }
}

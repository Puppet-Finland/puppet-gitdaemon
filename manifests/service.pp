#
class gitdaemon::service inherits gitdaemon::params {

    service { 'gitdaemon':
        name    => $::gitdaemon::params::service_name,
        enable  => true,
        require => Class['::gitdaemon::install'],
    }
}

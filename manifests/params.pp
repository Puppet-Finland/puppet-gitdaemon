#
# == Class: gitdaemon::params
#
# Defines some variables based on the operating system
#
class gitdaemon::params {

    case $::osfamily {
        'Debian': {
            $package_name = 'git-daemon-sysvinit'
            $service_name = 'git-daemon'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}

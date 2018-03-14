#
# == Class: gitdaemon::params
#
# Defines some variables based on the operating system
#
class gitdaemon::params {

    case $::osfamily {
        'Debian': {
            $package_name = 'git-daemon-sysvinit'
            $base_path = '/var/lib'
            $directory = '/var/lib/git'
            $service_name = 'git-daemon'
        }
        default: {
            fail("Unsupported OS: ${::osfamily}")
        }
    }
}

# == Class: gitdaemon::config::debian
#
# This class configures git-daemon on Debian
#
class gitdaemon::config::debian
(
    String $base_path,
    String $directory

) inherits gitdaemon::params
{
    $ini_settings = {   'GIT_DAEMON_ENABLE'    => true,
                        'GIT_DAEMON_BASE_PATH' => $base_path,
                        'GIT_DAEMON_DIRECTORY' => $directory, }

    $ini_settings.each |$item| {
        ini_setting { $item[0]:
            ensure  => 'present',
            path    => '/etc/default/git-daemon',
            setting => $item[0],
            value   => $item[1],
        }
    }
}

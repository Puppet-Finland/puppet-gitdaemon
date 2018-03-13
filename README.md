# puppet-gitdaemon

A Puppet module for managing git-daemon. Install, service and packetfilter are 
supported right now.

# Module usage

Setup git-daemon using Hiera:

    classes:
        - gitdaemon

For details, see

* [Class: gitdaemon](manifests/init.pp)

# Dependencies

See [metadata.json](metadata.json).

# Operating system support

This module has been tested on

* Debian 9

Any *NIX-style operating system should work out of the box or with small
modifications.

For details see [params.pp](manifests/params.pp).

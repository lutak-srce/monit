#monit

####Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with monit](#setup)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

##Overview

The monit module installs, configures, and manages the monit service.

##Module Description

The monit module handles installing, configuring, and running monit for Debian Jessie distribution.

##Setup

###Beginning with monit

`include '::monit'` is enough to get you up and running.  If you wish to pass in parameters specifying which services to manage:

```puppet
class { '::monit':
  services_managed => [ 'apache2', 'rsyslog' ],
}
```

##Usage

##Reference

###Classes

####Public Classes

* monit: Main class, includes all other classes.

####Private Classes

* monit::package: Installs monit package.
* monit::config: Handles the configuration files.
* monit::service: Handles the service.
* monit::services: Handles the monit managed services.

###Parameters

##Limitations

This module has been tested on Debina Jessie, and no issues have been identified.

##Development

###Contributors

To see who's already involved, see the [list of contributors.](https://github.com/lutak-srce/monit/graphs/contributors)

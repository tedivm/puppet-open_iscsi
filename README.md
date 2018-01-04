# iscsi

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What iscsi affects](#what-iscsi-affects)
    * [Setup requirements](#setup-requirements)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)

## Overview

This module manages the iscsi service on Debian and Redhat family nodes.

## Module Description

This module installs and configures the iscsi packages (Redhat's iscsid or
Debian's open-iscsi) and manages it's configuration. This allows nodes to
connect to iscsi servers, such as the AWS Storage Gateway.

## Setup

### What iscsi affects

* This module manages the iscsi configuration and ensures it's service is
  running.
* A new fact, "iscsi_initiator", exposes the unique identifier for the iscsi
  node.

### Setup Requirements

In order to use the bundled fact you need to have pluginsync enabled.


## Usage

The simplest way to use this module is to include the iscsi::initiator class.

```puppet
include iscsi::initiator
```

This class also supports a variety of options, such as CHAP authentication.

```puppet
class { 'iscsi::initiator':
  startup => "automatic",

  node_authmethod => 'CHAP'
  node_username => 'iqn.1993-08.org.debian:01:3181f68bc3dd',
  node_password => 'jXb8F5uR22KhpJkFTTTYtA',
  node_username_in => $::iscsi_initiator,
  node_password_in => 'C9LbgUQGAXGuv4bEjGxgYt',
}
```


## Reference

### Facts

* [*iscsi_initiator*]
    This fact gives the initiator name (ie,
    "iqn.1993-08.org.debian:01:3181f68bc3dd"). It's important to note that this
    fact returns false during the first run where the module is installed as the
    iqn is created when the package is installed, after facts are evaluated.


### classes

#### *iscsi::initiator*

* [*node_authmethod*] - ISCSI authentication method. Defaults to false.

* [*node_username*] - Username server uses to authenticate to client. Defaults to false.

* [*node_password*] - Password server uses to authenticate to client. Defaults to false.

* [*node_username_in*] - Username client uses to authenticate to server. Defaults to false.

* [*node_password_in*] - Password client uses to authenticate to server. Defaults to false.

* [*discovery_authmethod*] - ISCSI authentication method. Defaults to false.

* [*discovery_username*] - Node (server) username for discovery. Defaults to
    false.

* [*discovery_password*] - Node (server) username for discovery. Defaults to
    false.

* [*discovery_username_in*] - Initiator (client) username for discovery.
    Defaults to false.

* [*discovery_password_in*] - Initiator (client) username for discovery.
    Defaults to false.

* [*startup*] - Whether to use automatic or manual startup. Defaults to manual.

* [*leading_login*] - Whether to login to targets one at a time (true) or to
    attempt each connection (false). Defaults to true.

* [*replacement_timeout*] - Defaults to 120.

* [*login_timeout*] - Defaults to 15.

* [*logout_timeout*] - Defaults to 15.

* [*noop_out_interval*] - Defaults to 5.

* [*noop_out_timeout*] - Defaults to 5.

* [*abort_timeout*] - Defaults to 15.

* [*lu_reset_timeout*] - Defaults to 30.

* [*tgt_reset_timeout*] - Defaults to 30.

* [*initial_login_retry_max*] - Defaults to 8.

* [*session_cmds_max*] - Defaults to 128.

* [*session_queue_depth*] - Defaults to 32.

* [*xmit_thread_priority*] - Defaults to -20.

* [*initial_r2t*] - Defaults to false.

* [*immediate_data*] - Defaults to true.

* [*first_burst_length*] - Defaults to 262144.

* [*max_burst_length*] - Defaults to 16776192.

* [*max_recv_data_segment_length*] - Defaults to 262144.

* [*max_xmit_data_segment_length*] - Defaults to 0.

* [*header_digest*] - Defaults to "None".

* [*data_digest*] - Defaults to "None"

* [*nr_sessions*] - Defaults to 1.

* [*max_recv_data_segment_length*] - Defaults to 32768.

* [*fast_abort*] - Defaults to true.

* [*iscsid_conf*] - Defaults to "/etc/iscsi/iscsid.conf".

* [*iscsid_startup*] - Sets the restart script for the service. The default
    depends on the operating system.


## Limitations

This module currently handles installation and services, but does not yet
provide functionality to mount the specific drives. This has to be done manually
using iscsiadm.

## Development

Contributions are always welcome. Please read the [Contributing Guide](CONTRIBUTING.md)
to get started.

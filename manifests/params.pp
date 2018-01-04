# Class: iscsi::params
#
# This class manages parameters for the iscsi module
class iscsi::params {

  # Auth settings
  $node_authmethod = false
  $node_username = false
  $node_password = false
  $node_username_in = false
  $node_password_in = false
  $discovery_authmethod = false
  $discovery_username = false
  $discovery_password = false
  $discovery_username_in = false
  $discovery_password_in = false

  # Startup settings
  $startup = 'manual'
  $leading_login = false

  # Timeouts
  $replacement_timeout = 120

  $login_timeout = 15
  $logout_timeout = 15
  $noop_out_interval = 5
  $noop_out_timeout = 5

  $abort_timeout = 15
  $lu_reset_timeout = 30
  $tgt_reset_timeout = 30

  # Retry
  $initial_login_retry_max = 8

  # session and device queue depth
  $session_cmds_max = 128
  $session_queue_depth = 32

  # MISC SYSTEM PERFORMANCE SETTINGS
  $xmit_thread_priority = -20


  # iSCSI settings
  $initial_r2t = false
  $immediate_data = true
  $first_burst_length = 262144
  $max_burst_length = 16776192
  $max_recv_data_segment_length = 262144
  $max_xmit_data_segment_length = 0
  $header_digest = None
  $data_digest = None
  $nr_sessions = 1

  $max_recv_data_segment_length = 32768

  # Workarounds
  $fast_abort = true

  $iscsid_conf = '/etc/iscsi/iscsid.conf'

  case $::osfamily {
    debian: {
      $packages = 'open-iscsi'
      $service = 'open-iscsi'
      $iscsid_startup = '/usr/sbin/iscsid'
    }

    redhat: {
      $packages = 'iscsi-initiator-utils'
      $service = 'iscsid'
      $iscsid_startup = '/etc/rc.d/init.d/iscsid force-start'
    }

    default: {
      fail('ISCSI only works on Debian or Redhat families of linux.')
    }
  }
}

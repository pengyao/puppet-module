class ntp::service {
	service { "ntpd":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["ntp::config"],
    }
}

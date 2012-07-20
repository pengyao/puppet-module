class glusterfsclient::service {
	service { "glusterd":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["glusterfsclient::config"],
	}
}

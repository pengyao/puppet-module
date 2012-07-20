class ganglia::service {
	service { "gmond":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["ganglia::config"],
	}
}

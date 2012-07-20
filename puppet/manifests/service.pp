class puppet::service {
	service { "puppet":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["puppet::config"],
	}
}

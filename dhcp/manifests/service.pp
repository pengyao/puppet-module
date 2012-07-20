class dhcp::service {
	service { "dhcpd":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["dhcp::config"],
	}
}

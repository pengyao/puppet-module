class haproxy::service {
	service { "haproxy":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["haproxy::install"],
	}
}

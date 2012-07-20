class mysql::service {
	service { "mysqld":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["mysql::config"],
	}
}

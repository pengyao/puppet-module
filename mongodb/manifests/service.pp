class mongodb::service {
	service { "mongodbd":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["mongodb::config"],
	}
}

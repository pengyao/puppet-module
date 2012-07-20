class crontab::service {
	service { "crond":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["crontab::config"],
	}
}

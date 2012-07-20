class icinga::service {
#	service { "ido2db":
#		ensure => running,
#		enable => true,
#		hasstatus => true,
#		hasrestart => true,
#		require => Class["icinga::config"],
#	}

	service { "icinga":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["icinga::config"],
		notify  => Class["httpd::service"],
	}
}

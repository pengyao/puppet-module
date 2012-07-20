class cobbler::service {
	service { "cobblerd":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["cobbler::config"],
		notify  => Class["httpd::service"],
	}
}

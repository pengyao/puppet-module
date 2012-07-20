class httpd::service {
	service { "httpd":
	ensure => running,
	enable => true,
	hasstatus => true,
	hasrestart => true,
	require => Class["httpd::install"],
	}
}

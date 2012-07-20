class haproxy::install {
	package { "haproxy":
		ensure => present,
		notify => Class["haproxy::service"],
	}
}

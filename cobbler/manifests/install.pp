class cobbler::install {
	package { "cobbler":
		name    => [ "cobbler", "cobbler-web", ],
		ensure  => present,
	}
}

class icinga::install {
	package { "icinga":
		name    => [ "icinga-idoutils", "icinga-doc", "icinga", "icinga-api", ],
		ensure  => present,
	}

	package { "icinga-gui":
		ensure  => present,
		require => Class["httpd::install"],
	}

#	package { "icinga-web":
#		name	=> [ "libdbi", "libdbi-dbd-mysql", "libdbi-devel", "libdbi-drivers", ],
#		ensure  => present,
#		require => [Class["httpd::install"], Package["icinga"]],
#	}

}

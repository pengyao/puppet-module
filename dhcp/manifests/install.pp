class dhcp::install {
	package { "dhcp":
		name    => "dhcp",
		ensure  => present,
	}
}

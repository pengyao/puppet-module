class sudoer::config {
	file { "/etc/sudoers":
		owner    => "root",
		group    => "root",
		mode     => "0440",
		source   => "puppet:///sudoer/sudoers",
		require => Class["sudoer::install"],
	}
}

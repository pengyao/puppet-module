class resolv::config {
	file { "/etc/resolv.conf":
		ensure => present,
		owner => 'root',
		group => 'root',
		mode => 0644,
		source => "puppet:///resolv/resolv.conf",
	}
}

class ntp::config {
	file { "/etc/ntp.conf":
		owner => "root",
		group => "root",
		mode => "0644",
		source => "puppet:///ntp/ntp.conf",
		require => Class["ntp::install"],
		notify => Class["ntp::service"],
	}
}



class httpd::config {
	file { "/etc/httpd/conf.d/status.conf":
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => "0644",
		source => "puppet:///httpd/status.conf",
		require => Class["httpd::install"],
        notify => Class["httpd::service"],
	}
}

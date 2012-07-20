class mysql::config {
	file {  "/etc/my.cnf":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "0644",
		source => "puppet:///mysql/my.cnf",
		require => Class["mysql::install"],
		notify => Class["mysql::service"],
	}
}

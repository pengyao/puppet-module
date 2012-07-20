class mongodb::config {
	file {  "/etc/my.cnf":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "0644",
		source => "puppet:///mongodb/my.cnf",
		require => Class["mongodb::install"],
		notify => Class["mongodb::service"],
	}
}

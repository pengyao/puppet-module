class func::config {
	$require = Class["func::install"]
	File {
		owner  => "root",
		group  => "root",
		mode   => "0644",
	}
	
	file { 
		"/etc/certmaster/minion.conf":
		ensure => present,
		source => "puppet:///func/minion.conf",
		notify => Class["func::service"];


		"/etc/func/minion.conf":
		ensure => present,
		content => template("func/minion.conf.erb"),
		notify => Class["func::service"];

		"/etc/init.d/certmaster":
		ensure => absent;
	}
}

class func::service {
	$require = Class["func::config"]

	Service {
		hasstatus => true,
		hasrestart => true,
	}

	service { 
		"funcd":
		ensure => running,
		enable => true;
	}
}

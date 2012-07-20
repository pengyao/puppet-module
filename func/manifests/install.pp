class func::install {
	package { "func":
		ensure => present,
		notify => Class["func::config"],
	}
}

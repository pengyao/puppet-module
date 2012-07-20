class puppet::install {
	package { [ "facter", "puppet" ]:
		ensure => latest,
		notify => Class["puppet::config"],
	}
}

class puppet::install {
	Package {
		ensure => latest,
	}
	package {
		"facter": 
		notify => Class["puppet::service"];
		
		"puppet" :
		notify => Class["puppet::config"];
	}
}

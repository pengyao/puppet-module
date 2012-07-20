class puppetmaster::service {
	exec { 
		command => "/usr/local/bin/puppetmasterd",
		require => Class["puppetmaster::install"],
	}	
}

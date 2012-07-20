class puppetmaster::install {

	package { [ "puppet-server" ]:
		ensure     => latest,
		notify     => Class["puppetmaster::config"],	
	}









}

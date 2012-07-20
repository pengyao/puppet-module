class mcollective::install {
	package { "mcollective-common":
		name   => "mcollective-common",
		ensure => installed,
		source => "http://${puppetserver}/mcollective-common-1.2.1-1.el5.noarch.rpm",
		provider => "rpm",
   }
	package { "mcollective-client":
		name   => "mcollective-client",
		ensure => installed,
		source => "http://${puppetserver}/mcollective-client-1.2.1-1.el5.noarch.rpm",
		provider => "rpm",
   }
}

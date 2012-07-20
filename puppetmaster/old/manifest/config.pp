class puppetmaster::config {


	
	$basedir = "/etc/puppet"



	File {
		owner  => "puppet",
		group  => "puppet",
		mode   => "644",
	}	

	file { 
		"${basedir}":

		"${basedir}/manifests":
		ensure =>directory;
		
		"${basedir}/manifests/nodes":
		ensure =>directory;

		"${basedir}/modules":
		ensure =>directory;

		"${basedir}/auth.conf":
		source => "puppet:///puppetmaster/auth.conf";

		"${basedir}/fileserver.conf":
		source => "puppet:///puppetmaster/fileserver.conf"};

		"${basedir}/namespaceauth.conf":
		source => "puppet:///puppetmaster/namespaceauth.conf";

		"${basedir}/puppet.conf":
		source => "puppet:///puppetmaster/puppet.conf";
		
		"${basedir}/tagmail.conf":
		source => "puppet:///puppetmaster/tagmail.conf";

		"${basedir}/manifests/site.pp":
		source => "puppet:///puppetmaster/site.pp";

		"${basedir}/manifests/nodes/base.pp":
		source => "puppet:///puppetmaster/base.pp";

		require => Class["puppetmaster::install"],
		notify => Class["puppetmaster::service"],
	}
}

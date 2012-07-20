class puppetmaster::config {

		$require = Class["puppetmaster::install"]
		$notify = Class["puppetmaster::service"]

	
	File {
		owner  => "puppet",
		group  => "puppet",
		mode   => "644",
	}	

	file { 

		"/etc/puppet/manifests":
		ensure =>directory;
		
		"/etc/puppet/manifests/nodes":
		ensure =>directory;

		"/etc/puppet/modules":
		ensure =>directory;

		"/var/lib/puppet/run":
		ensure =>directory;

		"/etc/puppet/auth.conf":
		source => "puppet:///puppetmaster/auth.conf";

		"/etc/puppet/fileserver.conf":
		source => "puppet:///puppetmaster/fileserver.conf";

		"/etc/puppet/namespaceauth.conf":
		source => "puppet:///puppetmaster/namespaceauth.conf";

		"/etc/puppet/puppet.conf":
		source => "puppet:///puppetmaster/puppet.conf";
		
		"/etc/puppet/tagmail.conf":
		source => "puppet:///puppetmaster/tagmail.conf";

		"/etc/puppet/manifests/site.pp":
		source => "puppet:///puppetmaster/site.pp";


#		"/etc/puppet/manifests/nodes/base.pp":
#		source => "puppet:///puppetmaster/base.pp";

	}
}

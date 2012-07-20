class openstack::install {
	package { "openstackrepo":
		name		=> "openstack-repo-2011.3-0.4",
		ensure		=> installed,
		source 		=> "http://${puppetserver}/package/openstack-repo-2011.3-0.4.noarch.rpm",
		provider	=> "rpm",
	}
	
	package { "libvirt":
		name		=> "libvirt",
		ensure		=> installed,
		notify		=> Class["openstack::service"],
	}
}

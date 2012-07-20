class openstack::service {
#	$require = Class["openstack::config"]
	service { "libvirtd":
		ensure		=> "running",
		enable		=> true,
		hasstatus	=> true,
		hasrestart	=> true,
	}

	service { "dnsmasq":
		ensure		=> "stopped",
		enable		=> true,
		hasstatus	=> true,
		hasrestart	=> true,
	}
}

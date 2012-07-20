class dhcp::config {
	$require = Class["dhcp::install"]

	FIle {
		owner		=> "root",
		group		=> "root",
		mode 		=> "0644",
	}
		
	file { "dhcpd.conf":
		path		=> "/etc/dhcpd.conf",
		source		=> "puppet:///dhcp/dhcpd.conf",
#		require 	=> Class["dhcp::install"],
		notify		=> Class["dhcp::service"],
	}

	file { "dhcpd":
		path		=> "/etc/sysconfig/dhcpd",
		source		=> "puppet:///dhcp/dhcpd",
#		require 	=> Class["dhcp::install"],
		notify		=> Class["dhcp::service"],
	}
}

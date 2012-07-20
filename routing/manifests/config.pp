class routing::config {
	File {
			ensure => present,
			owner => 'root',
			group => 'root',
			mode => 0600,
	}
	if $is_virtual == 'true' {
		file { "routing":
			path => "/etc/sysconfig/network-scripts/route-eth1",
			source => $network_eth1 ? {
				'10.24.90.0' => "puppet:///routing/route-eth1.90",
				'10.24.94.0' => "puppet:///routing/route-eth1.94",
				default		 => undef,
			},
		}
	} else {
		file { "routing":
			path => "/etc/sysconfig/network-scripts/route-bond1",
			source => $network_bond1 ? {
				'10.24.90.0' => "puppet:///routing/route-bond1.90",
				'10.24.94.0' => "puppet:///routing/route-bond1.94",
				default		 => undef,
			},
		}
	}
}

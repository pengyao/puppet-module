class profile::config {
	$require = Class["profile::install"]
	File {
		owner	=> "root",
		group	=> "root",
		mode	=> "0644",
	}

	file {  
		"/etc/profile":
		ensure	=> present,
		source	=> "puppet:///profile/profile";

		"/etc/security/limits.d/openfile.conf":
		ensure	=> present,
		source	=> "puppet:///profile/openfile.conf";
	}

	augeas { "sysctl":
		context	=> "/files/etc/sysctl.conf",
		changes => [
			"set net.ipv4.tcp_syncookies  1",
			"set net.ipv4.tcp_tw_reuse  1",
			"set net.ipv4.tcp_tw_recycle  1",
			"set net.ipv4.tcp_fin_timeout  30",
			"set net.ipv4.tcp_keepalive_time  1800",
			"set net.ipv4.ip_local_port_range  1024 65000",
			"set net.ipv4.tcp_max_syn_backlog  8192",
			"set net.ipv4.tcp_max_tw_buckets  10000",
		],
	}
}

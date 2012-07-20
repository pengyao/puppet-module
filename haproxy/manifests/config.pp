class haproxy::config { 
	FIle {
		owner  => "root",
		group  => "root",
		mode   => "0644",
	}
	file { 
		"/usr/sbin/haproxy":
		ensure => present,
		mode   => "0755",
		source => "puppet:///haproxy/haproxy";

		"/etc/rsyslog.conf":
		ensure => present,
		source => "puppet:///haproxy/rsyslog.conf",
		require => Class["haproxy::install"],
		notify => Service["rsyslog"];

		"/etc/logrotate.d/haproxy":
		ensure => present,
		source => "puppet:///haproxy/haproxy_rotate";
	
		"/etc/haproxy/errfile":
		source => "puppet:///haproxy/errfile",
		recurse	=> true,
		ensure	=> "directory";

#		"/etc/monit.d/haproxy":
#		source => "puppet:///haproxy/haproxy.monit";
	}

	service { "rsyslog":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}

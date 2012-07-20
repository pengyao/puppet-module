class rsyslog::config {
	File {
		owner  => "root",
		group  => "root",
		mode   => "0644",
	}

	file { 
		"/etc/rsyslog.conf":
		ensure => present,
		source => "puppet:///rsyslog/rsyslog.conf",
		notify => Class["rsyslog::service"];

		"/etc/logrotate.d/haproxy_rotate":
		ensure => present,
		source => "puppet:///rsyslog/haproxy_rotate";
	}
}

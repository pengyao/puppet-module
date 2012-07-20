class apache::config {
	file { "/opt/httpd":
		ensure => link,
		target => "/opt/httpd-${apacheversion}",
		require => Class["apache::install"],
	}

	file { "httpd.init":
		path   => "/etc/init.d/httpd",
		source => "puppet:///apache/httpd.init",
		owner => "root",
		group => "root",
		mode   => 755,
		require => Class["apache::install"],
	}

	file { "/var/log/www":
		ensure => "directory",
		mode   => 755,
		require => Class["apache::install"],
	}

	file { "/var/log/cronlog":
		ensure => "directory",
		mode   => 755,
		require => Class["apache::install"],
	}

	file { "/opt/httpd-${apacheversion}/logs":
		ensure  => "directory",
		mode    => 755,
		require => [Class["apache::install"], File["/opt/httpd"]],
	}

	file { "conf":
		ensure => directory,
		recurse => true,
		path => "/opt/httpd-${apacheversion}/conf",
		source => "puppet:///apache/${confversion}",
		owner => "root",
		group => "root",
		notify => [Class["apache::service"], File["/opt/httpd"]],
		require => Class["apache::install"],
	}

	file { "htdocs":
		ensure => directory,
		recurse => true,
		path => "/opt/httpd-${apacheversion}/htdocs",
		source => "puppet:///apache/htdocs",
		owner => "root",
		group => "root",
		require => [Class["apache::install"], File["/opt/httpd"]],
	}

	file { "httpdcron":
		path   => "/etc/cron.daily/httpdcron",
		source => "puppet:///apache/httpdcron",
		ensure => present,
		owner => "root",
		group => "root",
		mode   => 755,
	}

	file { "httpdlogdel":
		path   => "/etc/cron.monthly/httpdlogdel",
		source => "puppet:///apache/httpdlogdel",
		ensure => present,
		owner => "root",
		group => "root",
		mode   => 755,
	}

	file { "apache_status.sh":
		path   => "/opt/httpd-${apacheversion}/bin/apache_status.sh",
		source => "puppet:///apache/apache_status.sh",
		ensure => present,
		owner => "root",
		group => "root",
		mode   => 755,
		require => Class["apache::install"],
	}
}

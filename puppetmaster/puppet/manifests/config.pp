class puppet::config {
	$require = Class["puppet::install"]

	file {  "/etc/init.d/puppet":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "755",
		source => "puppet:///puppet/puppet.init",
		notify => Class["puppet::service"],
	}

	file {  "/etc/puppet/auth.conf":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "644",
		source => "puppet:///puppet/auth.conf",
		notify => Class["puppet::service"],
	}

	file {  "/etc/puppet/namespaceauth.conf":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "644",
		source => "puppet:///puppet/namespaceauth.conf",
		notify => Class["puppet::service"],
	}

	file {  "/etc/puppet/puppet.conf":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "644",
		source => "puppet:///puppet/puppet.conf",
		notify => Class["puppet::service"],
	}
}

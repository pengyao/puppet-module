class openstack::hue {
	package { "hue":
		name		=> "hue",
		ensure		=> installed,
		require		=> [Class["jdk::install"], Package["openstackrepo"],],
		notify		=> File["hue.ini"],
	}

	file { "hue.ini":
		path		=> "/etc/hue/hue.ini",
		source		=> "puppet:///openstack/hue.ini",
		owner		=> "root",
		group		=> "root",
		mode		=> "0755",
		notify		=> Service["hue"],
	}

	file { "hue-shell.ini":
		path		=> "/etc/hue/hue-shell.ini",
		source		=> "puppet:///openstack/hue-shell.ini",
		owner		=> "root",
		group		=> "root",
		mode		=> "0755",
	}

	service { "hue":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
	}
}

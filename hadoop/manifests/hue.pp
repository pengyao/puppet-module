class hadoop::hue {
	package { "hue":
		name		=> "hue",
		ensure		=> installed,
		require		=> [Class["jdk::install"], Class["yumrepo"],],
		notify		=> File["hue.ini"],
	}

	file { "hue.ini":
		path		=> "/etc/hue/hue.ini",
		source		=> "puppet:///hadoop/hue.ini",
		owner		=> "root",
		group		=> "root",
		mode		=> "0755",
		notify		=> Service["hue"],
	}

	file { "hue-shell.ini":
		path		=> "/etc/hue/hue-shell.ini",
		source		=> "puppet:///hadoop/hue-shell.ini",
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

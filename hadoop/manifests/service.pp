class hadoop::service {
	$require = Class["hadoop::config"]
	service { "hadoop-0.20-datanode":
		ensure		=> "${datanode}",
		enable		=> "${datanodestatus}",
		hasstatus	=> true,
		hasrestart	=> true,
	}

	service { "hadoop-0.20-tasktracker":
		ensure		=> "${tasknode}",
		enable		=> "${taskstatus}",
		hasstatus	=> true,
		hasrestart	=> true,
	}

	service { "hadoop-0.20-secondarynamenode":
		ensure		=> stopped,
		enable		=> false,
		hasstatus	=> true,
		hasrestart	=> true,
	}

	service { "hadoop-0.20-jobtracker":
		ensure => "${jobnode}",
		enable => "${jobstatus}",
		hasstatus => true,
		hasrestart => true,
	}

	service { "hadoop-0.20-namenode":
		ensure => "${namenode}",
		enable => "${namestatus}",
		hasstatus => true,
		hasrestart => true,
	}
}

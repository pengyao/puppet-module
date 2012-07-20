class glusterfs::service {
	service { "glusterfsd":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["glusterfs::config"],
	}
}

class glusterfsclient::install {
	package { "glusterfsclient":
		name    => [ "glusterfs-devel", "glusterfs-fuse", "glusterfs-server", ],
		ensure  => latest,
		notify	=> Class["glusterfsclient::config"],
	}
}

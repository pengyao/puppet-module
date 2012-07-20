class glusterfs::install {
	package { "glusterfs":
		name    => [ "glusterfs-server", "glusterfs-devel", "glusterfs-fuse", "fuse-devel", "fuse",],
		ensure  => present,
		notify	=> Class["glusterfs::config"],
	}
}

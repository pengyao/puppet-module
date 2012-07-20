class glusterfs::config {
	$require = Class["glusterfs::install"]
	file { "glusterfsd.vol":
		path		=> "/etc/glusterfs/glusterfsd.vol",
		source		=> "puppet:///glusterfs/glusterfsd.vol",
		owner		=> "root",
		group		=> "root",
		notify		=> Class["glusterfs::service"],
	}

	file { [ "/export", "/export/glusterfs", ]:
		ensure 		=> "directory",
	}

	file { "/etc/sysconfig/modules/fuse.modules":
		ensure          => file,
		content         => "modprobe fuse",
		owner           => "root",
		group           => "root",
		mode            => "0644",
	}

	exec {"modprobe fuse":
		user            => root,
		path            => "/usr/sbin:/usr/bin:/bin:/sbin",
		command         => "modprobe fuse",
		unless          => "lsmod |grep fuse",
	}
}

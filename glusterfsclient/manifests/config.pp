class glusterfsclient::config {
	$require = Class["glusterfsclient::install"]
	file { "glusterfs.vol":
		path		=> "/etc/glusterfs/glusterfs.vol",
		source		=> "puppet:///glusterfsclient/glusterfs.vol",
		owner		=> "root",
		group		=> "root",
#		require 	=> Class["glusterfsclient::install"],
		notify		=> Class["glusterfsclient::service"],
	}

	file { "glusterd.vol":
		path		=> "/etc/glusterfs/glusterd.vol",
		source		=> "puppet:///glusterfsclient/glusterd.vol",
		owner		=> "root",
		group		=> "root",
#		require 	=> Class["glusterfsclient::install"],
		notify		=> Class["glusterfsclient::service"],
	}

	file { "/etc/sysconfig/modules/fuse.modules":
		ensure		=> file,
		content		=> "modprobe fuse",
		owner		=> "root",
		group		=> "root",
		mode		=> "0644",
	}

	exec {"modprobe fuse":
		user            => root,
		path            => "/usr/sbin:/usr/bin:/bin:/sbin",
		command         => "modprobe fuse",
		unless          => "lsmod |grep fuse",
	}
}

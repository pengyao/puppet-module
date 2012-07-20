class ganglia::server{
	$basedir = "/var/lib/ganglia"

	package { "rrdtool":
		name		=> ["rrdtool", "rrdtool-devel"],
		ensure		=> present,
	}
	package { "ganglia-server":
		source		=> "http://${puppetserver}/package/ganglia-server-3.3.1-1.x86_64.rpm",
		provider	=> "rpm",
		ensure		=> present,
		require		=> Package["rrdtool"],
	}

	package { "ganglia-web":
		source		=> "http://${puppetserver}/package/ganglia-web-3.3.1-1.noarch.rpm",
		provider	=> "rpm",
		ensure		=> present,
		require		=> Package["ganglia-server"],
	}

	File {
		owner		=> "apache",
		group		=> "apache",
		mode		=> "0644",
	}
	
	file {
		"/usr/local/etc/gmetad.conf":
		owner		=> "root",
		group		=> "root",
		source		=> "puppet:///ganglia/gmetad.conf",
		require		=> Package["ganglia-server"];

		"/etc/init.d/gmetad":
		owner		=> "root",
		group		=> "root",
		mode		=> "0755",
		source		=> "puppet:///ganglia/gmetad.init";

		"${basedir}":
		owner		=> "nobody",
		group		=> "nobody",
		ensure		=> "directory";

		"${basedir}/conf":
		ensure		=> "directory";

		"${basedir}/dwoo":
		ensure		=> "directory";

		"${basedir}/dwoo/cache":
		mode		=> "0777",
		ensure		=> "directory";

		"${basedir}/dwoo/compiled":
		mode		=> "0777",
		ensure		=> "directory";

		"${basedir}/rrds":
		owner		=> "nobody",
		group		=> "nobody",
		ensure		=> "directory";
	}

	service { "gmetad":
		ensure		 => running,
		enable		 => true,
		hasstatus	 => true,
		hasrestart	 => true,
		require		 => [File["/usr/local/etc/gmetad.conf"], File["/etc/init.d/gmetad"]],
	}
}

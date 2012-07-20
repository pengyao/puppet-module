class openstack::config {
	$require = Class["openstack::install"]
	file { "core-site.xml":
		path		=> "/etc/openstack-0.20/conf.pseudo/core-site.xml",
		source		=> "puppet:///openstack/core-site.xml",
		owner		=> "root",
		group		=> "root",
		mode        => "0755",
		notify		=> Class["openstack::service"],
	}

	file { "pig.properties":
		path		=> "/etc/pig/conf/pig.properties",
		source		=> "puppet:///openstack/pig.properties",
		owner		=> "root",
		group		=> "root",
		mode        => "0644",
	}

	file { "hdfs-site.xml":
		path		=> "/etc/openstack-0.20/conf.pseudo/hdfs-site.xml",
		source		=> "puppet:///openstack/hdfs-site.xml",
		owner		=> "root",
		group		=> "root",
		mode        => "0755",
		notify		=> Class["openstack::service"],
	}

	file { "mapred-site.xml":
		path		=> "/etc/openstack-0.20/conf.pseudo/mapred-site.xml",
		source		=> "puppet:///openstack/mapred-site.xml",
		owner		=> "root",
		group		=> "root",
		mode        => "0755",
		notify		=> Class["openstack::service"],
	}

	file { "masters":
		path		=> "/etc/openstack-0.20/conf.pseudo/masters",
		source		=> "puppet:///openstack/masters",
		owner		=> "root",
		group		=> "root",
		mode        => "0755",
		notify		=> Class["openstack::service"],
	}

	file { "slaves":
		path		=> "/etc/openstack-0.20/conf.pseudo/slaves",
		source		=> "puppet:///openstack/slaves",
		owner		=> "root",
		group		=> "root",
		mode        => "0755",
		notify		=> Class["openstack::service"],
	}

	file { "openstack-snappy-0.0.1-SNAPSHOT.jar":
		path		=> "/usr/lib/openstack/lib/openstack-snappy-0.0.1-SNAPSHOT.jar",
		source		=> "puppet:///openstack/openstack-snappy-0.0.1-SNAPSHOT.jar",
		owner		=> "root",
		group		=> "root",
		mode        => "0644",
		notify		=> Class["openstack::service"],
	}

	file { "native":
		path		=> "/usr/lib/openstack/lib/native",
		source		=> "puppet:///openstack/native",
		owner		=> "root",
		group		=> "root",
		mode        => "0644",
		recurse		=> true,
		notify		=> Class["openstack::service"],
	}

	file { "mysql-connector-java-5.1.15-bin.jar":
		path		=> "/usr/lib/hive/lib/mysql-connector-java-5.1.15-bin.jar",
		source		=> "puppet:///openstack/mysql-connector-java-5.1.15-bin.jar",
		owner		=> "root",
		group		=> "root",
		mode        => "0644",
	}

	file { "hive-site.xml":
		path		=> "/etc/hive/conf/hive-site.xml",
		source		=> "puppet:///openstack/hive-site.xml",
		owner		=> "root",
		group		=> "root",
		mode        => "0644",
	}

#	file { [ "/export", "/export/openstack", ]:
#	file { [ "/export", "/export/openstack", ]:
#		ensure 		=> "directory",
#	}
}

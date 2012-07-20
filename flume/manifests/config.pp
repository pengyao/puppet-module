class flume::config {
	$require = Class["flume::install"]
	File {
		owner		=> "root",
		group		=> "root",
		mode        => "0755",
	}

	file { 
	    "/var/flume":
		ensure		=> "directory",
		owner		=> "flume",
		group		=> "flume";

		"/var/flume/agent":
		ensure		=> "directory",
		owner		=> "flume",
		group		=> "flume";

		"flume-site.xml":
		path		=> "/etc/flume/conf/flume-site.xml",
		source		=> "puppet:///flume/flume-site.xml",
		notify		=> Class["flume::service"];

		"flume-env.sh":
		path		=> "/usr/lib/flume/bin/flume-env.sh",
		source		=> "puppet:///flume/flume-env.sh",
		notify		=> Class["flume::service"];
	}
}

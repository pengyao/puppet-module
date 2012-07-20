class ganglia::config {
#	$require = Class["ganglia::install"]

	File {
		owner   => "root",
		group   => "root",
		mode    => 644,
	}

	file {
		"/usr/local/etc/gmond.conf":
		content => template("ganglia/gmond.conf.erb"),
		notify  => Class["ganglia::service"];

		"/etc/init.d/gmond":
		source  => "puppet:///ganglia/gmond.init",
		mode    => "0755";
	}
}

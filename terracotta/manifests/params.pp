define terracotta::params ( $mem="12",
						$terracotta_instance_basedir="/usr/local/terracotta",
						$tcsrv=[]) {

	$require = Class["terracotta::config"]
	$basedir = "${terracotta_instance_basedir}"

	File {
		owner	=> "root",
		group 	=> "root",
		mode   	=> 0644,
	}

	file { 
		"${basedir}/conf/tc-config.xml":
		content => template("terracotta/tc-config.xml.erb"),
		notify => Class["terracotta::service"];

		"${basedir}/bin/start-tc-server.sh":
		content => template("terracotta/start-tc-server.sh.erb"),
		mode    => "0755",
		notify => Class["terracotta::service"];
	}
}

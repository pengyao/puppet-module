class monit::config {
	$require = Class["monit::install"]

	file {  
		"/etc/monit.conf":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> "600",
		content	=> template("monit/monit.conf.erb");
		
		"/etc/init.d/monit":
		ensure	=> absent;
	}

#	if $lsbmajdistrelease > 5 {
#		file {  "/etc/init/monit.conf":
#			ensure => present,
#			owner  => "root",
#			group  => "root",
#			mode   => "0644",
#			source => "puppet:///monit/monit.conf.init",
#		}
#	}
}

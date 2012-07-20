class tomcat::config {
	$require = Class["tomcat::install"]

	$basedir = "/usr/local/tomcat"

	File {
		owner	=> "tomcat",
		group	=> "tomcat",
		mode	=> "0644",
	}

	file { 
		"/usr/bin/restart.sh":
		source  => "puppet:///tomcat/restart.sh",
		owner	=> "root",
		group	=> "root",
		mode	=> "0700";

		"${basedir}":
		recurse	=> true;

		"${basedir}/bin/jsvc":
		source	=> "puppet:///tomcat/jsvc.32bit",
		mode	=> "0755";

		"${basedir}/bin/commons-daemon.jar":
		source	=> "puppet:///tomcat/commons-daemon.jar";

		"${basedir}/lib/terracotta-session-1.2.1.jar":
		source	=> "puppet:///tomcat/terracotta-session-1.2.1.jar";

		"${basedir}/lib/terracotta-toolkit-1.4-runtime-4.1.0.jar":
		source	=> "puppet:///tomcat/terracotta-toolkit-1.4-runtime-4.1.0.jar";

		"${basedir}/lib/ehcache.xml":
		content => template("tomcat/ehcache.xml.erb");

		"${basedir}/lib/mobcon":
		recurse => true,
		mode	=> "0777",
		ensure	=> "directory";

		"${basedir}/lib/mobcon/editions":
		mode	=> "0777",
		ensure	=> "directory";

		"${basedir}/lib/mobcon/editions/editionMap.xml":
		source	=> "puppet:///tomcat/editionMap.xml",
		mode	=> "0777";

		"${basedir}/lib/mobcon/editions/smartphone":
		mode	=> "0777",
		ensure	=> "directory";
	}
}

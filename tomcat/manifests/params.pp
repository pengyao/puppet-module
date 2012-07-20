define tomcat::params ( $server_port="8005",
						$http_port="8080",
						$jmx_port="8090",
						$tomcat_instance_basedir="/usr/local",
						$setenv=[]) {

	$require = Class["tomcat::install"]
	$tomcat_name = "${name}"
	$basedir = "${tomcat_instance_basedir}/${name}"

	File {
		owner	=> "tomcat",
		group 	=> "tomcat",
		mode   	=> 0644,
	}

	file { 
        "${basedir}":
        ensure 	=> directory;

		"${basedir}/conf":
		ensure 	=> directory;

		"${basedir}/logs":
		ensure 	=> directory;

		"${basedir}/temp":
		ensure 	=> directory;

		"${basedir}/webapps":
		ensure 	=> directory;

		"${basedir}/webapps/manager":
		recurse	 => true,
		source 	 => "puppet:///tomcat/manager";

		"${basedir}/work":
		ensure 	=> directory;

		"${basedir}/conf/context.xml":
		content => template("tomcat/context.xml.erb");

		"${basedir}/conf/web.xml":
		source  => "puppet:///tomcat/web.xml";

		"/etc/init.d/${name}":
		content => template("tomcat/tomcat.initd.erb"),
		mode   	=> 0755,
		owner 	=> "root",
		group 	=> "root";

		"/etc/logrotate.d/${name}_rotate":
		content => template("tomcat/tomcat_rotate.erb"),
		owner 	=> "root",
		group 	=> "root";

		"${basedir}/conf/server.xml":
		content => template("tomcat/server.xml.erb");

		"/etc/monit.d/${name}":
		content => template("tomcat/tomcat.monit.erb"),
		owner 	=> "root",
		group 	=> "root",
		require => Class["monit::install"],
	}
}

class tomcat::install {
	$require = Class["yumrepo"]

	user {"tomcat":
		ensure		=> present,
		home		=> "/usr/local/tomcat",
		comment		=> "Tomcat user",
		gid 		=> "tomcat",
		shell		=> "/bin/false",
		require		=> Group["tomcat"],
	}

	group {"tomcat":
		ensure		=> present,
	}

	package { "mesa-libGL":
		name		=> "mesa-libGL.i686",
		ensure 		=> installed,
	}

	package { "jdk32bit":
		name		=> "jdk",
		ensure		=> installed,
		source		=> "http://${puppetserver}/package/jdk-${jdkversion}-linux-i586.rpm",
		require		=> Package["mesa-libGL"],
		provider	=> "rpm",
	}

	package { "tomcat6":
		name   		=> "tomcat6",
		ensure		=> $tomcat_version,
		require		=> [Package["jdk"], User["tomcat"],],
		notify		=> Class["tomcat::config"],
	}
}

class jdk::install {
	package { "jdk":
		name		=> "jdk",
		ensure		=> installed,
		source		=> "http://${puppetserver}/package/jdk-6u31-linux-amd64.rpm",
		provider	=> "rpm",
	}
}

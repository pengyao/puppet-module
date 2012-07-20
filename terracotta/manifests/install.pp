class terracotta::install {
	package { "terracotta":
		name   		=> "terracotta",
		ensure		=> installed,
		source		=> "http://${puppetserver}/package/terracotta-${tcversion}.noarch.rpm",
		provider	=> "rpm",
#		require		=> Class["jdk::install"],
		notify		=> Class["terracotta::config"],
	}
}

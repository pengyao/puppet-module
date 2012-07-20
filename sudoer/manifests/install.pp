class sudoer::install {
	package { "sudo":
		ensure => present,
	}
}

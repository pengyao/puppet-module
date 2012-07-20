class monit::install {
	package { "monit":
		ensure => present,
#		notify => Class["monit::config"],
	}
}

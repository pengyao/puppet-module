class yumrepo {
	File {
		owner   => "root",
		group   => "root",
		mode    => "0644",
	}

	file {
		"/etc/yum.repos.d/mobcon.repo":
		source  => "puppet:///yumrepo/mobcon.repo",
	}

#	package { "cdh3-repository":
#		ensure	=> present,
#		require => File["/etc/yum.repos.d/mobcon.repo"],
#	}
}

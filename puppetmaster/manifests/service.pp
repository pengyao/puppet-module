class puppetmaster::service {
	service {"puppetmastard":
		ensure     => running,
		hasstatus  => true,
		hasrestart => true,
		enable     => true,
		require => Class["puppetmaster::config"],
	}
}

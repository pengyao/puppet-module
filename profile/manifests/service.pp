class profile::service {
	exec {"sysctl":
		user		=> root,
		refreshonly	=> true,
		command 	=> "sysctl -p",
	}
}

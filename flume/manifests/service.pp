class flume::service {
	$require = Class["flume::config"]
	service { "flume-master":
		ensure		=> "${flumemaster}",
		enable		=> "${flumemasterstatus}",
		hasstatus	=> true,
		hasrestart	=> true,
	}

	service { "flume-node":
		ensure		=> "${flumenode}",
		enable		=> "${flumenodestatus}",
		hasstatus	=> true,
		hasrestart	=> true,
	}
}

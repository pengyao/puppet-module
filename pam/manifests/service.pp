class pam::service {
	if $lsbmajdistrelease == 6 {
		service { "sssd":
			ensure => running,
			enable => true,
			hasstatus => true,
			hasrestart => true,
			require => Class["pam::config"],
		}

		service { "oddjobd":
			ensure => running,
			enable => true,
			hasstatus => true,
			hasrestart => true,
			require => Class["pam::config"],
		}
	}
}

class pam::install {
	if $lsbmajdistrelease == 6 {
		package { "sssd":
			name => [ "sssd", "sssd-client", "oddjob", "oddjob-mkhomedir", "nss-pam-ldapd", ], 
			ensure => installed,
			notify  => Class["pam::config"],
		}
	}
}

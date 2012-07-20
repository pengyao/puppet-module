class pam::config {

	File {
		owner   => "root",
		group   => "root",
		mode    => 644,
	}

	file { 
	    "/etc/ldap.conf":
		ensure => present,
		source => "puppet:///pam/ldap.conf";

		"/export":
		mode    => "0755",
		ensure => directory;
		
		"/export/home":
		mode    => "0755",
		ensure => directory;
	}

	if $lsbmajdistrelease == 6 {
		$require = Class["pam::install"]

		file {  
		    "/etc/pam.d/system-auth-ac":
			ensure => present,
			source => "puppet:///pam/system-auth-ac.6",
			notify => Class["pam::service"];
		
		    "/etc/pam.d/password-auth-ac":
			ensure => present,
			source => "puppet:///pam/password-auth-ac.6",
			notify => Class["pam::service"];
		
			"/etc/nsswitch.conf":
			ensure => present,
			source => "puppet:///pam/nsswitch.conf.6",
			notify => Class["pam::service"];

			"/etc/sysconfig/authconfig":
			ensure => present,
			source => "puppet:///pam/authconfig.6",
			notify => Class["pam::service"];

			"/etc/sssd/sssd.conf":
			ensure => present,
			mode   => "0600",
			source => "puppet:///pam/sssd.conf.6",
			notify => Class["pam::service"];
		}
	} else {
		file {  
			"/etc/pam.d/system-auth-ac":
			ensure => present,
			source => "puppet:///pam/system-auth-ac.5";
		
			"/etc/nsswitch.conf":
			ensure => present,
			source => "puppet:///pam/nsswitch.conf.5";

			"/etc/sysconfig/authconfig":
			ensure => present,
			source => "puppet:///pam/authconfig.5";
		}
	}
}

class mcollective::config {
	file { "/etc/certmaster/minion.conf":
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => "0644",
		source => "puppet:///mcollective/minion.conf",
		require => Class["mcollective::install"],
                notify => Class["mcollective::service"],
	}

        file {  "/etc/mcollective/minion.conf":
		ensure => present,
                owner => "root",
                group => "root",
                mode => "644",
                content => template("mcollective/minion.conf.erb"),
                require => Class["mcollective::install"],
                notify => Class["mcollective::service"],
        }
}

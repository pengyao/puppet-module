class mcollective::service {
        service { "mcollectived":
                ensure => running,
                enable => true,
		hasstatus => true,
		hasrestart => true,
                require => Class["mcollective::config"],
        }
}

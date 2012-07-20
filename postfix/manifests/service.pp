class postfix::service {
	service { "sendmail":
		ensure  => stopped,
		enable  => false,
                require => Class["postfix::install"],
	}

        service { "postfix":
                ensure => running,
                enable => true,
		hasstatus => true,
		hasrestart => true,
                require => [Class["postfix::install"], Service["sendmail"]],
        }
}

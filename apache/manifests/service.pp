class apache::service {
        service { "httpd":
                name => "httpd",
                ensure => running,
                enable => true,
		hasstatus => true,
                hasrestart => true,
                require => [Class["apache::install"], Class["apache::config"]],
        }
}

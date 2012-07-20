class apache::install {
	package { "httpd":
                name   => "httpd",
                ensure => installed,
                source => "http://${puppetserver}/httpd-${apacheversion}-1.i386.rpm",
                provider => "rpm",
        }
}

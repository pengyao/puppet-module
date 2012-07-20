class httpd::install {
        package { [ "httpd", "httpd-devel" ]:
                ensure => present,
        }
}

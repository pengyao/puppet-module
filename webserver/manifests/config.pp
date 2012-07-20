class webserver::config {
        file { "httpd.init":
                path   => "/etc/init.d/httpd",
                source => "puppet:///apache/httpd.init",
                owner => "root",
                group => "root",
                mode   => 755,
        }
        file { "apache_status.sh":
                path   => "/opt/httpd/bin/apache_status.sh",
                source => "puppet:///apache/apache_status.sh",
                ensure => present,
                owner => "root",
                group => "root",
                mode   => 755,
        }

        file { "/var/log/cronlog":
                ensure => "directory",
                mode   => 755,
	}

        file { "httpdcron":
                path   => "/etc/cron.daily/httpdcron",
                source => "puppet:///apache/httpdcron",
                ensure => present,
                owner => "root",
                group => "root",
                mode   => 755,
        }

        file { "httpdlogdel":
                path   => "/etc/cron.monthly/httpdlogdel",
                source => "puppet:///apache/httpdlogdel",
                ensure => present,
                owner => "root",
                group => "root",
                mode   => 755,
        }

}

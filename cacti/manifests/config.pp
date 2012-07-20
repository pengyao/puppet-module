class cacti::config {
	exec {"create mysql db cacti":
		user		=> root,
		path		=> "/usr/sbin:/usr/bin:bin",
		command 	=> "mysql -e 'CREATE DATABASE cacti'",
		unless		=> "mysql -e 'SHOW DATABASES' |grep -q cacti",
		require 	=> Class["cacti::install"],
		notify		=> Exec["grant mysql user cacti"],
	}

	exec {"grant mysql user cacti":
		user		=> root,
		path		=> "/usr/sbin:/usr/bin:bin",
		command 	=> "mysql -e \"GRANT ALL PRIVILEGES ON cacti.* to cactiuser@localhost IDENTIFIED BY 'cactiuser'\"",
		refreshonly => true,
		require		=> Exec["create mysql db cacti"],
		notify		=> Exec["import mysql cacti"],
	}

	exec {"import mysql cacti":
		user		=> root,
		path		=> "/usr/sbin:/usr/bin:bin",
		command 	=> "mysql -uroot cacti </var/www/cacti/cacti.sql",
		refreshonly => true,
		require		=> Exec["create mysql db cacti"],
	}

	file { "cacti.conf":
		ensure => present,
		path => "/etc/httpd/conf.d/cacti.conf",
		source => "puppet:///cacti/cacti.conf",
		owner => "root",
		group => "root",
		notify => Class["httpd::service"],
		require => Class["cacti::install"],
	}
}

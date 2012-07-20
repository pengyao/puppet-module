class icinga::config {
	file { "icinga":
		ensure		=> directory,
		recurse		=> true,
		path		=> "/etc/icinga",
		source		=> "puppet:///icinga/icinga",
		owner		=> "icinga",
		group		=> "icinga",
		require 	=> Class["icinga::install"],
		notify		=> Class["icinga::service"],
	}

	file { "/var/log/icinga":
		ensure => "directory",
		mode   => 755,
		require => Class["icinga::install"],
	}
	
#	exec {"create mysql db icinga":
#		user		=> root,
#		path		=> "/usr/sbin:/usr/bin:bin",
#		command 	=> "mysql -e 'CREATE DATABASE icinga'",
#		unless		=> "mysql -e 'SHOW DATABASES' |grep -q icinga",
#		require 	=> Package["icinga-web"],
#		notify		=> Exec["grant mysql user icinga"],
#	}
#
#	exec {"grant mysql user icinga":
#		user		=> root,
#		path		=> "/usr/sbin:/usr/bin:bin",
#		command 	=> "mysql -e \"GRANT ALL PRIVILEGES ON icinga.* to icinga@localhost IDENTIFIED BY 'icinga'\"",
#		refreshonly => true,
#		require		=> Exec["create mysql db icinga"],
#		notify		=> Exec["import mysql icinga"],
#	}
#
#	exec {"import mysql icinga":
#		user		=> root,
#		path		=> "/usr/sbin:/usr/bin:bin",
#		command 	=> "mysql -uroot icinga </etc/icinga/idoutils/mysql/mysql.sql",
#		refreshonly => true,
#		require		=> [Exec["create mysql db icinga"], File["icinga"]],
#	}

}

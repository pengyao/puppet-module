class zabbixagent {
        include  zabbixagent::install, zabbixagent::config, zabbixagent::service
}

class zabbixagent::server {
	include zabbixagent

	package { "zabbixserver":
		name 	=> ["zabbix-server-mysql", "zabbix-server", "zabbix-web-mysql", "mysql-server", ],
		ensure	=> "installed",
		require	=> Class["mysql::install"],
		notify  => Exec["create mysql db zabbix"],
	}

	exec {"create mysql db zabbix":
		user        => root,
		path        => "/usr/sbin:/usr/bin:bin",
		command     => "mysql -e 'CREATE DATABASE zabbix'",
		unless      => "mysql -e 'SHOW DATABASES' |grep -q zabbix",
		require     => Package["zabbixserver"],
		notify      => Exec["grant mysql user zabbix"],
	}

	exec {"grant mysql user zabbix":
		user        => root,
		path        => "/usr/sbin:/usr/bin:bin",
		command     => "mysql -e \"GRANT ALL PRIVILEGES ON zabbix.* to zabbix@localhost IDENTIFIED BY 'zabbix'\"",
		refreshonly => true,
		require     => Exec["create mysql db zabbix"],
		notify      => Exec["import mysql zabbix"],
	}

	exec {"import mysql zabbix":
		user        => root,
		path        => "/usr/sbin:/usr/bin:bin",
		command     => "mysql -uroot zabbix < /usr/share/doc/zabbix-server-${zabbixserver}/schema/mysql.sql",
		refreshonly => true,
		require     => Exec["create mysql db zabbix"],
	}

	exec {"import mysql zabbix data":
		user        => root,
		path        => "/usr/sbin:/usr/bin:bin",
		command     => "mysql -uroot zabbix < /usr/share/doc/zabbix-server-${zabbixserver}/data/data.sql",
		refreshonly => true,
		require     => Exec["create mysql db zabbix"],
	}

	exec {"import mysql zabbix images":
		user        => root,
		path        => "/usr/sbin:/usr/bin:bin",
		command     => "mysql -uroot zabbix < /usr/share/doc/zabbix-server-${zabbixserver}/data/images_mysql.sql",
		refreshonly => true,
		require     => Exec["create mysql db zabbix"],
	}

	service { "zabbix-server":
		ensure		=> running,
		enable		=> true,
		hasstatus	=> true,
		hasrestart	=> true,
		require		=> Package["zabbixserver"],
	}
}

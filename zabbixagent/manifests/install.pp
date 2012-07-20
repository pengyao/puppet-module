class zabbixagent::install {
	user {"zabbix":
		ensure		=> present,
		home		=> "/var/lib/zabbix",
		shell		=> "/sbin/nologin",
	}

	package { "zabbixagent":
		name    => [ "zabbix-agent", ],
		ensure  => "installed",
		require => User["zabbix"],
		notify  => Class["zabbixagent::config"],
	}

}

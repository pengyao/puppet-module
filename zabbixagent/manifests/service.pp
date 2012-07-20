class zabbixagent::service {
	service { "zabbix-agent":
		ensure		=> running,
		enable		=> true,
		hasstatus	=> true,
		hasrestart	=> true,
		require		=> Class["zabbixagent::config"],
	}
}

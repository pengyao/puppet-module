class zabbixagent::config {
	$require = Class["zabbixagent::install"]

	File {
		owner		=> "root",
		group		=> "root",
		mode		=> 755,
	}

	file { 
		"zabbix_agentd.conf":
		path		=> "/etc/zabbix/zabbix_agentd.conf",
		mode		=> 644,
		content		=> template("zabbixagent/zabbix_agentd.conf.erb"),
		notify		=> Class["zabbixagent::service"];

		"zabbix-agent.init":
		path		=> "/etc/init.d/zabbix-agent",
		source		=> "puppet:///zabbixagent/zabbix-agent.init";

		"statuscode.pl":
		path		=> "/usr/bin/statuscode.pl",
		source		=> "puppet:///zabbixagent/statuscode.pl";
	}
}

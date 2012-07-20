class snmp::service {
	service { "snmpd":
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class["snmp::config"],
	}
}

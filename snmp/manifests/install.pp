class snmp::install {
	package { "net-snmp":
		ensure => installed,
	}
}

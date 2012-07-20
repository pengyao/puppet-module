class snmp::config {
	file {  "/etc/snmp/snmpd.conf":
		ensure => present,
		owner => "root",
		group => "root",
		mode => "0644",
		source => "puppet:///snmp/snmpd.conf",
		require => Class["snmp::install"],
		notify => Class["snmp::service"],
	}
}

class kvm::config {
	file { "/etc/kvm/kvm.conf":
		ensure => present,
		owner  => "root",
		group  => "root",
		mode   => "0644",
		source => "puppet:///kvm/kvm.conf",
		require => Class["kvm::install"],
        notify => Class["kvm::service"],
	}
	file { "/var/www/html":
		ensure => "directory",
		mode   => 755,
		require => Class["kvm::install"],
	}
}

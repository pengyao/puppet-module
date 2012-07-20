class kvm::service {
	service { "kvm":
	ensure => running,
	enable => true,
	hasstatus => true,
	hasrestart => true,
	require => Class["kvm::install"],
	}
}

class terracotta::service {
	service { 'terracotta':
		ensure => running,
		enable => true,
		hasstatus => true,
		hasrestart => true,
		require => Class['terracotta::config'],
	}
}

class crontab::install {
	package { "cronie-noanacron":
		ensure => present,
	}

	package { "cronie-anacron":
		ensure => absent,
	}
}

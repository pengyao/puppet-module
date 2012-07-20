class cacti::install {
	package { "cacti-package-list":
		name   => ["cacti", "cacti-docs", "cacti-spine"],
		ensure => present,
	}
}

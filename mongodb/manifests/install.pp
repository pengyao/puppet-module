class mongodb::install {
	package { "mongodb-server":
		ensure => installed,
	}
}

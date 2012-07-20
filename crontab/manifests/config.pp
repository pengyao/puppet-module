class crontab::config {
	File {
		owner	=> "root",
		group	=> "root",
		mode	=> "0644",
	}
	file { "/etc/cron.d/dailyjobs":
		ensure	=> present,
		source	=> "puppet:///crontab/dailyjobs",
		require => Class["crontab::install"],
		notify	=> Class["crontab::service"],
	}
}

define haproxy::params ( $frontnode=[],
						$backnode=[]) {
	file { "/etc/haproxy/haproxy.cfg":
		ensure	=> present,
		owner	=> "root",
		group	=> "root",
		mode	=> "0644",
		content	=> template("haproxy/haproxy.cfg.erb"),
		require	=> Class["haproxy::install"],
#		notify	=> Class["haproxy::service"],
	}
}

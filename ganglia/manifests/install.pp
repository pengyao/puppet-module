class ganglia::install {
	package { apr_libconfuse:
		name		=> ["libconfuse", "libconfuse-devel", "apr", "apr-devel"],
		ensure		=> present,
	}

	package { "ganglia":
		name		=> ["ganglia"],
		source		=> "http://${puppetserver}/package/ganglia-3.3.1-1.x86_64.rpm",
		provider	=> "rpm",
		ensure		=> present,
		require		=> Package["apr_libconfuse"],
		notify      => Class["ganglia::config"],
	}
}

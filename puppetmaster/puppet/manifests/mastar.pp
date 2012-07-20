class puppet::master {

	include puppet

	package { "puppet-server":
		ensure     => installed,
	}





	service {"puppetmastard"}:
		ensure     => running,
		hasstatus  => running,
		hasrestart => true,
		enable     => true,
		require    => File["/etc/puppet/puppet/conf"],



}

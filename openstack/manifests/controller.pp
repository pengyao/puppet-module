class openstack::controller {
	include openstack::install

	package { "openstack-nova-node-full":
		name		=> "openstack-nova-node-full",
		ensure		=> installed,
		require		=> Package["openstackrepo"],
#		notify		=> Class["openstack::config"],
	}

	service { "mysqld":
		ensure          => "running",
		enable          => true,
		hasstatus       => true,
		hasrestart      => true,
	}

	service { "rabbitmq-server":
		ensure          => "running",
		enable          => true,
		hasstatus       => true,
		hasrestart      => true,
	}
}

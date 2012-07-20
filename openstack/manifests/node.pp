class openstack::node {
	include openstack::install

	package { "openstack-nova-node-compute":
		name		=> "openstack-nova-node-compute",
		ensure		=> installed,
		require		=> Package["openstackrepo"],
#		notify		=> Class["openstack::config"],
	}
}

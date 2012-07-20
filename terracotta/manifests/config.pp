class terracotta::config {
	$require = Class["terracotta::install"]

	File {
		owner 	=> "root",
		group 	=> "root",
		mode	=> "0644",
	}

	file { 
		"/var/log/terracotta":
		ensure	=> directory;

		"/usr/local/terracotta/conf/":
		ensure	=> directory,
		mode	=> "0755";

		"/usr/local/terracotta/platform/modules":
		source  => "puppet:///terracotta/modules",
		ensure	=> directory,
		recurse => "true",
		notify => Class["terracotta::service"];

		"/etc/init.d/terracotta":
		source  => "puppet:///terracotta/terracotta.init",
		mode    => "0755";

	}
}

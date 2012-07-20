define nginx::config( $nginxport='80' ) {
	$require = Class["nginx::install"]

	File {
		owner	=> "root",
		group	=> "root",
		mode	=> "0644",
	}
	file { 
		"/etc/nginx/nginx.conf":
		ensure	=> present,
		content => template("nginx/nginx.conf.erb");
#		notify	=> Class["nginx::service"];

		"/etc/nginx/conf.d/default.conf":
		ensure	=> present,
		content => template("nginx/nginx.default.conf.erb");
#		notify	=> Class["nginx::service"];

		"/usr/share/nginx/html/sorry.html":
		ensure	=> present,
		source	=> "puppet:///nginx/sorry.html";

		"/usr/share/nginx/html/404.html":
		ensure	=> present,
		source	=> "puppet:///nginx/sorry.html";

		"/usr/share/nginx/html/50x.html":
		ensure	=> present,
		source	=> "puppet:///nginx/sorry.html";
	}
}

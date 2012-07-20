class httpd::install {


	${basedir} = "/usr/local/src"

	File {
		owner  => "root",
		group  => "root",
		mode   => "755",
	}

	file {
		"${basedir}":

		"${basedir}/ruby-1.8.7-p299.tar.gz":
		source => "puppet:///puppetmaster/ruby-1.8.7-p299.tar.gz";

		"${basedir}/rubygems-1.3.7.tgz:
		source => "puppet:///puppetmaster/rubygems-1.3.7.tgz"};

		exec { command => "/bin/tar ${basedir}/ruby-1.8.7-p299.tar.gz -C ${basedir}"}
		exec { command => "cd ${basedir}/ruby-1.8.7-p299/;./configure -prefix=/usr"}
		exec { command => "cd ${basedir}/ruby-1.8.7-p299/;make"}
		exec { command => "cd ${basedir}/ruby-1.8.7-p299/;make install"}
		exec { command => "cd ${basedir}/ruby-1.8.7-p299/;make clean"}

		exec { command => "/bin/tar ${basedir}/rubygems-1.3.7.tgz -C ${basedir}"}
		exec { command => "cd ${basedir}/rubygems-1.3.7/;/usr/local/bin/ruby setup.rb"}

		exec { command => "cd ${basedir};/usr/local/bin/gem install --remote --source http://reductivelabs.com/downloads puppet"}
		exec { command => "cd ${basedir};/usr/local/bin/gem install puppet"}

	}
}


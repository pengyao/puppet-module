class jenkins::install {
	file { "jenkinsrepo":
		path            => "/etc/yum.repos.d/jenkins.repo",
		source          => "puppet:///jenkins/jenkins.repo",
		owner           => "root",
		group           => "root",
		mode        => "0644",
		notify          => Package["jenkins"],
	}

	package { "jenkins":
		ensure		=> installed,
		require		=> [Class["jdk::install"], File["jenkinsrepo"],],
		notify		=> Class["jenkins::service"],
	}
}

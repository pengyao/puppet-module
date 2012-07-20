class hadoop::install {
	package { "hadoop":
		name		=> ["hadoop-0.20-conf-pseudo", "hadoop-0.20-native", "hadoop-pig", "hadoop-hive", "hue-plugins", ],
		ensure		=> installed,
		require		=> [Class["jdk::install"], Class["yumrepo"],],
		notify		=> Class["hadoop::config"],
	}

	package { "hive":
		name		=> ["hadoop-hive", "hadoop-hive-metastore", "hadoop-hive-server" ],
		ensure		=> installed,
		require		=> [Class["jdk::install"], Class["yumrepo"],],
		notify		=> Class["hadoop::config"],
	}

	package { "snappy":
		name		=> "snappy",
		ensure		=> installed,
		source		=> "http://${puppetserver}/package/snappy-1.0.5-1.x86_64.rpm",
		provider	=> "rpm",
	}
}

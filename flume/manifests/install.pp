class flume::install {
	package { "flume":
		name		=> ["flume", "flume-master", "flume-node","hadoop-0.20-native",],
		ensure		=> installed,
		require     => [Class["jdk::install"], Class["yumrepo"],],
		notify		=> Class["flume::config"],
	}
}

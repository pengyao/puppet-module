class hadoop::config {
	$require = Class["hadoop::install"]
	File {
		owner		=> "root",
		group		=> "root",
		mode        => "0644",
	}

	file { 
		"core-site.xml":
		path		=> "/etc/hadoop-0.20/conf.pseudo/core-site.xml",
		source		=> "puppet:///hadoop/core-site.xml",
		mode        => "0755",
		notify		=> Class["hadoop::service"];

		"pig.properties":
		path		=> "/etc/pig/conf/pig.properties",
		source		=> "puppet:///hadoop/pig.properties";

		"hdfs-site.xml":
		path		=> "/etc/hadoop-0.20/conf.pseudo/hdfs-site.xml",
		source		=> "puppet:///hadoop/hdfs-site.xml",
		mode        => "0755",
		notify		=> Class["hadoop::service"];

		"mapred-site.xml":
		path		=> "/etc/hadoop-0.20/conf.pseudo/mapred-site.xml",
		source		=> "puppet:///hadoop/mapred-site.xml",
		mode        => "0755",
		notify		=> Class["hadoop::service"];

		"masters":
		path		=> "/etc/hadoop-0.20/conf.pseudo/masters",
		source		=> "puppet:///hadoop/masters",
		mode        => "0755",
		notify		=> Class["hadoop::service"];

		"slaves":
		path		=> "/etc/hadoop-0.20/conf.pseudo/slaves",
		source		=> "puppet:///hadoop/slaves",
		mode        => "0755",
		notify		=> Class["hadoop::service"];

		"hadoop-snappy-0.0.1-SNAPSHOT.jar":
		path		=> "/usr/lib/hadoop/lib/hadoop-snappy-0.0.1-SNAPSHOT.jar",
		source		=> "puppet:///hadoop/hadoop-snappy-0.0.1-SNAPSHOT.jar",
		notify		=> Class["hadoop::service"];

		"native":
		path		=> "/usr/lib/hadoop/lib/native",
		source		=> "puppet:///hadoop/native",
		recurse		=> true,
		notify		=> Class["hadoop::service"];

		"mysql-connector-java-5.1.15-bin.jar":
		path		=> "/usr/lib/hive/lib/mysql-connector-java-5.1.15-bin.jar",
		source		=> "puppet:///hadoop/mysql-connector-java-5.1.15-bin.jar";

		"hive-site.xml":
		path		=> "/etc/hive/conf/hive-site.xml",
		source		=> "puppet:///hadoop/hive-site.xml";
	}
}

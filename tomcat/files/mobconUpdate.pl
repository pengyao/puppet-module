#!/usr/bin/perl
# mobconUpdate.pl v1.0
# author ohtani_t

use File::Copy;
use File::Path;

#アップデート対象の確認
$war_name=$ARGV[0];
$war_md5=$ARGV[1];
$jar_name=$ARGV[2];
$jar_md5=$ARGV[3];

if($war_name eq "") {
   print "【NG】ROOT.warを指定してください。\n";
   exit;
}

if($war_md5 eq "") {
   print "【NG】ROOT.warのmd5を指定してください。\n";
   exit;
}

if($jar_name ne "") {
  if($jar_md5 eq "") {
     print "【NG】smartphone.jarのmd5を指定してください。\n";
     exit;
  }
}

#日付の取得（yyyymmdd）
($sec, $min, $hour, $day, $mon, $year) = localtime(time);
$year += 1900;
$mon++;
$toDay = sprintf("%04d%02d%02d", $year, $mon, $day);

#/home/honey/$toDayフォルダの作成
$backup_dir = "/home/honey/" . $toDay;
if ( mkdir $backup_dir ) {
#   print "【OK】$backup_dirフォルダを作成しました。\n";
} else {
   if (-e $backup_dir) {
#      print "【OK】$backup_dirフォルダは、すでに存在しています。\n";
   } else {
      print "【NG】$backup_dirフォルダの作成に失敗しました。\n";
      exit 1;
   }
}

#/home/honey/$toDay/backupフォルダの作成
$backup_dir = $backup_dir . "/backup";
if ( mkdir $backup_dir ) {
#   print "【OK】$backup_dirフォルダを作成しました。\n";
   $backup_dir = $backup_dir . "/";
} else {
   if (-e $backup_dir) {
#      print "【OK】$backup_dirフォルダは、すでに存在しています。\n";
   } else {
      print "【NG】$backup_dirフォルダの作成に失敗しました。\n";
      exit 2;
   }
}

#tmpフォルダの作成
$tmp_dir = "/tmp/" . $toDay;
if ( mkdir $tmp_dir ) {
#   print "【OK】$tmp_dirフォルダを作成しました。\n";
} else {
   if (-e $backup_dir) {
#      print "【OK】$tmp_dirフォルダは、すでに存在しています。\n";
   } else {
      print "【NG】$tmp_dirフォルダの作成に失敗しました。\n";
      exit 3;
   }
}

#httpdサービスを停止する
$return_value = `service httpd stop`;
if ($return_value =~ m/OK/) {
#    print "【OK】httpdサービスを停止しました。\n";
} else {
    print "【NG】httpdサービスの停止に失敗しました。\n";
    exit 4;
}

#tomcatサービスを停止する

$target=`/opt/java/bin/jps|grep Bootstrap|sort|head -n1`;
($target) = split(/ /, $target, 2);

if ( kill 9, $target ){


#$return_value = `service tomcat stop`;
#if ($return_value =~ m/停止/) {
#    print "【OK】tomcatサービスを停止しました。\n";

} else {
    print "【NG】tomcatサービスの停止に失敗しました。\n";
    exit 5;
}

#ROOT.warを$backup_dirへ移動する
$target = "/opt/tomcat/webapps/ROOT.war";
if( move $target, $backup_dir ){
#    print "【OK】$targetを$backup_dir に移動しました。\n";
} else{
    print "【NG】$targetを$backup_dir に移動できませんでした。\n";
    exit 6;
}

#smartphone.jarを$backup_dirへ移動する
if($jar_name ne "") {
  $target = "/etc/mobcon/editions/smartphone/smartphone.jar";
  if( move $target, $backup_dir ){
#      print "【OK】$targetを$backup_dir に移動しました。\n";
  } else{
    print "【NG】$targetを$backup_dir に移動できませんでした。\n";
    exit 7;
  }
}

#workフォルダを削除する
$target = "/opt/tomcat/work/Catalina";
if( rmtree($target) ){
#    print "【OK】$targetを削除しました。\n";
} else{
    print "【NG】$targetの削除に失敗しました。\n";
    exit 8;
}

#ROOTフォルダを削除する
$target = "/opt/tomcat/webapps/ROOT";
if( rmtree($target) ){
#    print "【OK】$targetを削除しました。\n";
} else{
    print "【NG】$targetの削除に失敗しました。\n";
    exit 9;
}

#portmapサービスを開始する
#$return_value = `service portmap start`;
#if ($return_value =~ m/OK/) {
#    print "【OK】portmapサービスを開始しました。\n";
#} else {
#    print "【NG】portmapサービスの開始に失敗しました。\n";
#    exit 8;
#}

#10.24.94.42:/mnt/workをマウントする
$return_value = `mount -t nfs 10.24.94.42:/mnt/work /mnt/`;
if ($return_value eq "") {
#    print "【OK】10.24.94.42:/mnt/workをマウントしました。\n";
} else {
    print "【NG】10.24.94.42:/mnt/workのマウントに失敗しました。\n";
    exit 10;
}

#ROOT.warを/opt/tomcat/webapps/へ移動する
$target = "/mnt/deploy/" . $war_name;
if( copy $target, "/opt/tomcat/webapps/ROOT.war" ){
#    print "【OK】$targetを/opt/tomcat/webapps/ROOT.warにコピーしました。\n";
} else{
    print "【NG】$targetを/opt/tomcat/webapps/ROOT.warにコピー失敗しました。\n";
    exit 11;
}

#ROOT.warのmd5をチェックする
$return_value = `md5sum /opt/tomcat/webapps/ROOT.war`;
($return_value) = split(/ /, $return_value, 2);
if ($return_value eq $war_md5) {
#    print "【OK】ROOT.warのmd5が一致しました。\n";
} else {
    print "【NG】ROOT.warのmd5が一致しません。$return_value\n";
    exit 12;
}

#ROOT.warのパーミッションを644にする。
$return_value = `chmod 644 /opt/tomcat/webapps/ROOT.war`;
if ($return_value eq "") {
#    print "【OK】ROOT.warのパーミッションを644にしました。\n";
} else {
    print "【NG】ROOT.warのパーミッションを644にできませんでした。\n";
    exit 13;
}

#smartphone.jarを/etc/mobcon/editions/smartphoneへ移動する
if($jar_name ne "") {
  $target = "/mnt/deploy/" . $jar_name;
  if( copy $target, "/etc/mobcon/editions/smartphone/smartphone.jar" ){
#      print "【OK】$targetを/etc/mobcon/editions/smartphone/smartphone.jarにコピーしました。\n";
  } else{
      print "【NG】$targetを/etc/mobcon/editions/smartphone/smartphone.jarにコピー失敗しました。\n";
      exit 14;
  }
}

#smartphone.jarのmd5をチェックする
if($jar_name ne "") {
  $return_value = `md5sum /etc/mobcon/editions/smartphone/smartphone.jar`;
  ($return_value) = split(/ /, $return_value, 2);
  if ($return_value eq $jar_md5) {
#      print "【OK】smartphone.jarのmd5が一致しました。\n";
  } else {
      print "【NG】smartphone.jarのmd5が一致しません。\n";
      exit 15;
  }
}

#smartphone.jarのパーミッションを644にする。
$return_value = `chmod 644 /etc/mobcon/editions/smartphone/smartphone.jar`;
if ($return_value eq "") {
#    print "【OK】smartphone.jarのパーミッションを644にしました。\n";
} else {
    print "【NG】smartphone.jarのパーミッションを644にできませんでした。\n";
    exit 16;
}

#10.24.94.42:/mnt/workをアンマウントする
$return_value = `umount -l /mnt/`;
print $return_value;
if ($return_value eq "") {
#    print "【OK】/mnt/をアンマウントしました。\n";
} else {
    print "【NG】/mnt/のアンマウントに失敗しました。\n";
    exit 17;
}

#tomcatサービスを開始する
$return_value = `/sbin/service tomcat start`;
if ($return_value =~ m/起動/) {
#    print "【OK】tomcatサービスを開始しました。\n";
} else {
    print "【NG】tomcatサービスの開始に失敗しました。$return_value\n";
    exit 18;
}

#httpdサービスを開始する
$return_value = `service httpd start`;
if ($return_value =~ m/OK/) {
#    print "【OK】httpdサービスを開始しました。\n";
} else {
    print "【NG】httpdサービスの開始に失敗しました。$return_value\n";
    exit 19;
}

print "ok";
exit 0;


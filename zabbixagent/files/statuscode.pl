#!/usr/bin/perl

$status_code = $ARGV[0];

($sec, $min, $hour, $day, $mon, $year) = localtime(time);
$year += 1900;
$mon++;
$toDay = sprintf("%04d%02d%02d", $year, $mon, $day);

$access_log = "/var/log/www/access_log." . $toDay;
$now = sprintf(":%02d:%02d:", $hour, $min);
$result = `cat $access_log | grep $now | grep \'\" $status_code \' | wc -l`;
print "$result";
exit 0;


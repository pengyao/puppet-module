#!/bin/sh
# version: 0.15
# date: 2012/04/17

tomcat_no=$1

check=`echo ${tomcat_no} | sed 's/^[1-8]//g'`

RESTARTLOG=/var/log/tomcat/restart-$(date +%Y%m%d-%H%M%S).log 

if [ "${check}" != "" ] || [ "${tomcat_no}" = "" ]; then
	echo "引数は1から8の数字のみです。"

	exit 1
fi

check_info () {
    restart scripts tomcat${tomcat_no} start
    curl -s http://honey:opera@localhost:808${tomcat_no}/config/foo/dumpthreads
    echo ""
    curl -s http://honey:opera@localhost:808${tomcat_no}/config/foo/dumpehcache
    echo "==============meminfo====start=========="
    echo /proc/meminfo
    echo "==============meminfo====end=========="
    echo ""
    echo "==============cpuinfo====start=========="
    echo /proc/cpuinfo
    echo "==============cpuinfo====end=========="
    echo ""
    echo "==============netstat====start=========="
    netstat -n
    echo "==============netstat====end=========="
    echo ""
    echo "==============ps====start=========="
    ps ax | grep jsvc | grep -v grep
    echo "==============ps====end=========="
}

check_info > $RESTARTLOG

for i in ` ps ax | grep tomcat${tomcat_no} | grep -v grep | awk '{print $1}'`
do
	kill -9 ${i}
done
sleep 2
service tomcat${tomcat_no} start

exit 0

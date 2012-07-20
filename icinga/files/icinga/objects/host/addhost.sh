#!/bin/bash

CFG="host.cfg"
[ -f $CFG ] && cp -f $CFG $CFG.`date +%Y%m%d` || :

host_cfg_init () {

echo "###############################################################################"
echo "###############################################################################"
echo "#"
echo "# HOST DEFINITION"
echo "#"
echo "###############################################################################"
echo "###############################################################################"
echo ""
echo "# Define a host for the local machine"
echo ""
echo "define host{"
echo "        use                     linux-server            ; Name of host template to use"
echo "                                                        ; This host definition will inherit all variables that are defined"
echo "                                                        ; in (or inherited by) the linux-server host template definition."
echo "        host_name               localhost"
echo "        alias                   localhost"
echo "        address                 127.0.0.1"
echo "        }"
echo ""
}

host_templ () {
echo ""
echo "# Define a host for the $HOST"
echo ""
echo "define host{"
echo "        use                     linux-server"
echo "        host_name               $HOST"
echo "        alias                   $HOST"
echo "        address                 $IP"
echo "        }"
echo ""
}

add_host () {
while read HOST IP
do
    host_templ
done < host.list
}

main (){
host_cfg_init
add_host
}


main > $CFG

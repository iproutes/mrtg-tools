#!/bin/bash

if [ $# -eq 0 ]; then
    echo ""
    echo "***HALT: addHost.sh requires an argument:  [IP address|DNS hostname]"
    echo ""
    exit 1
fi

# Edit these values to match your environment
comStr="YOUR_COMM_STRING"
base="/var/www/html/mrtg"
wwwHost="sub.domain.tld"

# Depending on your OS release, these paths may
# need to be changed:
cfg="/usr/bin/cfgmaker"
index="/usr/bin/indexmaker"
mrtg="/usr/bin/mrtg"

echo "$cfg --title=$1 $comStr@$1"
echo "Creating configuration file for $1"
mkdir $base/$1
$cfg --ifdesc=alias,desc,name,type --global "workdir: /var/www/html/mrtg/$1/" --global "options[_]: growright,bits" $comStr@$1 >$base/$1/$1.cfg

echo "Creating device index file"
$index --title="$1" $base/$1/$1.cfg >$base/$1/index.html

echo "Running initial SNMP collection on $1"
env LANG=C $mrtg $1/$1.cfg

echo ""
echo "Done!  Now add this to your CRONTAB:  (I'm also outputting this to cron.txt in your working directory)"
echo "*/5 * * * * env LANG=C $mrtg $base/$1/$1.cfg"
echo "*/5 * * * * env LANG=C $mrtg $base/$1/$1.cfg" >>cron.txt
echo ""
echo "Graphs should be available here:  http://${wwwHost}/mrtg/$1/index.html"
echo ""

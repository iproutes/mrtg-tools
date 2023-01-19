# mrtg-tools
Some CLI tools for MRTG

### addHost.sh
Creates an MRTG configuration file, index file and suggests a CRON entry to keep graphs updating. Command requires two arguments:
- hostname/IP address
- community string

i.e.: `./addHost.sh 10.1.2.3 commStr1ng`

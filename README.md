# mrtg-tools
Some CLI tools for MRTG

### addHost.sh
Creates an MRTG configuration file, index file and suggests a CRON entry to keep graphs updating. Command requires one argument:
- hostname/IP address

i.e.: `./addHost.sh 10.1.2.3`

Community strings, webhost and MRTG paths are defined and should be modified inside the script.

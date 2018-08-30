#!/bin/bash
#script for collecting forensic info on linux systems in BASH

# Get the Time information
function getDate(){
DATE=`date`
TMP=`timedatectl | grep "Time zone"`
TIMEZONE="${TMP//,}"
UPTIME=`uptime -p`
echo "[TIME]"
echo "Date:${DATE//,}"
echo $TIMEZONE
echo "Up Time:${UPTIME//,}"
echo
}

# Get the OS information
function getOSInfo(){
echo "[OS INFO]"
OS=`cat /etc/*release | grep "^NAME=" | cut -c6- `
OSDEETS=`cat /etc/*release | grep "release"`
KERNEL=`uname -r`
echo "OS:${OS//,}"
echo "OS(version):${OSDEETS//,}"
echo "Kernel:${KERNEL//,}"
echo
}

# Get hardware specs
function getHardWare(){
echo "[HARDWARE]"
CPU=`uname -p`
echo "CPU:${CPU//,}"
RAM=`grep MemTotal /proc/meminfo | awk '{print $2}'`
echo "RAM:${RAM//,} kB"
NUMDRIVES=`lsblk | grep disk | wc -l`
echo "HDD Amount:$NUMDRIVES"
echo
DRIVES=`lsblk -d`
echo "[HARDDRIVE LIST]"
echo "$DRIVES"
echo 
MOUNT=`df -h`
echo "[MOUNTED LIST]"
echo "$MOUNT"
echo
}

# gets the hostname and domain
function getHostnameAndDomain(){
echo "[HOSTNAME AND DOMAIN]"
HNAME=`hostname`
DNAME=`hostname -d`
echo "Hostname:${HNAME//,}"
echo "Domainname:${DNAME//,}"
echo
}

# gets a list of the users 
function getUsers(){
echo "stub"
}

# get what starts on boot
function getOnBoot(){
echo "stub"
}

# list the scheduled tasks
function getSchedTasks(){
echo "stub"
}

# get network info
function getNetworkInfo(){
echo "stub"
}

# get the network,share,
function getNetworkShares(){
echo "stub"
}

# get the installed software 
function getInstalledSoft(){
echo "stub"
}

# get a process list
function getProcessList(){
echo "stub"
}

# get a driver list
function getDriverList(){
echo "stub"
}

# get file list
function getFileList(){
echo "stub"
}

getDate >> output.txt
getOSInfo >> output.txt
getHardWare >> output.txt
getHostnameAndDomain >> output.txt
getUsers >> output.txt
getOnBoot >> output.txt
getSchedTasks >> output.txt
getNetworkInfo >> output.txt
getNetworkShares >> output.txt
getInstalledSoft >> output.txt
getProcessList >> output.txt
getDriverList >> output.txt
getFileList >> output.txt

#!/bin/bash
# peychart@mail.pf-20140512
[ "_$(whoami)" != "_root" ] && echo "Must be root..." >&2 && exit 1
IP=$*

if basename $0| grep -qs "^u" || [ "_$1" = "_-u" ]; then
  # un-attachAllIscsiTargets:

  shift; if [ -n "$1" ]; then
    for i in $*; do
      if ! echo $i| egrep -qs "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+"; then
        >&2 echo "Syntax: $0 [-u] [ ip1 [ ip2 [...] ] ]" && exit 1
      fi
    done

    for i in $*; do
      for j in $(iscsiadm -m session| grep "$i:3260,"| cut -d' ' -f4); do
        iscsiadm -m node -u -T $j
      done
    done

  else
    for i in $(iscsiadm -m session| cut -d' ' -f4); do
      iscsiadm -m node -u -T $i
    done
  fi

else
  # attachAllIscsiTargets:
  #LIB="Nmap scan report for "; nmap -nsP 192.168.0.1-254 | grep "$LIB"| sed -e 's/^'"$LIB"'//'

  while for i in $IP; do echo $i| egrep -qs "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+" || break; false; done; do
    if [ -n "$i" ]; then echo "Syntax: $0 [-u] [ ip1 [ ip2 [...] ] ]"; fi
    echo -e "ip(s)=\c"; sleep 1; read IP
  done

  for j in $IP; do
    for i in $(iscsiadm --mode discovery --type sendtargets --portal $j| grep "$j:"| cut -d' ' -f2); do
      iscsiadm --mode node --targetname $i --portal $j --login
    done
  done

fi

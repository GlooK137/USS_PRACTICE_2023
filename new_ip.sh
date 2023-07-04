#!/bin/bash

while [ $# -gt 0 ] ; do
  case $1 in
	  (--new-ip) new_ip="$2" ;;
	  (-h | --help) echo -e "use --new-ip to set second ip for default iface" && exit 1;;

  esac
  shift
done
if [ -z $new_ip ]; then
	echo "use --new-ip to set second ip for default iface"
	exit 1
fi
interface_name=$(ip route | grep default | awk '{print $5}')
ip addr add $new_ip dev $interface_name  2> /dev/null

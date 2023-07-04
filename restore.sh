#!/bin/bash
# example_args.sh

while [ $# -gt 0 ] ; do
  case $1 in
	  (-A | --archive) archive_path="$2" ;;
	  (-D | --destination) destination_path="$2" ;;
	  (-h | --help) echo -e "Use -A (--archive) for set path to archive\nUse -D (--destination) for set path to destination for unarchived files" && exit 1;;

  esac
  shift
done

if [ -z $archive_path ]; then
	echo "Use -A (--archive) for set path to archive"
	exit 1
else
	case ${archive_path#*.} in
		(tar) tar xvf $archive_path -C $destination_path;;
		(tar.gz) tar xvfz $archive_path -C $destination_path;;
		(zip) unzip $archive_path -d $destination_path;;
	esac		
fi
if [ -z $destination_path ]; then
	echo "Use -D (--destination) for set path to destination for unarchived files"
	exit 1
fi
echo "Succesed !!"

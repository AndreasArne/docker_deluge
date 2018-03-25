#!/bin/bash
# Delete extra folders or files left after delete in deluge

torrentname=$2
torrentpath=$3
log()
{
	echo "$@" >> /config/deluged.log
	#echo "$@" >> deluged.log
}
log "Delete trying for torrent forlder: $@"
cd "${torrentpath}"

if [ -d "$torrentname" ]; then
	rm -rf "${torrentname}"
	log "Deleted folder"
elif [[ "$torrentname" = *".rar" ]] ||  [[ "$torrentname" = *".zip" ]] # if file is rar or zip
then
	name_no_suffix="${torrentname%.rar}" # remove suffix from filename
	name_no_suffix="${name_no_suffix%.zip}" # remove suffix from filename
	if [ -d "$name_no_suffix" ]; then # if folder for rar|zip file exist.
		rm -rf "${name_no_suffix}"
		log "Deleted folder without suffix: $name_no_suffix"
	fi
fi

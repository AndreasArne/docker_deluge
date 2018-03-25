#!/bin/bash
formats=(zip rar)
commands=([zip]="unzip -u" [rar]="unrar -o- e")

torrentid=$1
torrentname=$2
torrentpath=$3
extraction_subdir=$2


log()
{
    echo "$@" >> /config/deluged.log
}

log "Torrent complete: $@"
cd "${torrentpath}"
for format in "${formats[@]}"; do
    while read file; do 
        log "Extracting \"$file\""
        cd "$(dirname "$file")"
        file=$(basename "$file")
        # if extraction_subdir is not empty, extract to subdirectory
        if [[ ! -z "$extraction_subdir" ]] ; then
            mkdir "$extraction_subdir"
            cd "$extraction_subdir"
            file="../$file"
        fi
        ${commands[$format]} "$file"
    done < <(find "$torrentpath/$torrentname" -iname "*.${format}" )
done
chmod -R 777 "$torrentpath/$torrentname/$torrentname"
log "done extracting"

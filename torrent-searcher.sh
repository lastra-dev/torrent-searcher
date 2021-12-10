#!/usr/bin/bash

baseurl="https://apibay.org"

if [ -z $1 ]; then
  query=$(: | dmenu -p "Search Torrent: ")
else
  query=$1
fi

# Change spaces with + 
query="$(sed 's/ /+/g' <<<$query)"

if [ -z $query ]; then
  # search top 100 torrents
  body="$(curl -s $baseurl/precompiled/data_top100_all.json)"
else
  body="$(curl -s $baseurl/q.php?q=$query)"
fi

if [[ $body == *"No results returned"* ]]; then
  notify-send "😔 Torrent not found."
  exit 0
fi

SELECTION=$(
echo $body |
  jq -r '. | to_entries | .[] | "\(.key) - \(.value.size) - [S:\(.value.seeders), L:\(.value.leechers)] - \(.value.name)"' |
  numfmt --to=iec --field=3 --delimiter=\  |
  dmenu -i -p "Select Torrent: " -l 25 |
  cut -d\- -f1 |
  awk '{$1=$1; print}'
)

if [ -z $SELECTION ]; then
  exit 0
fi

notify-send "✨ Downloading..."

INFO_HASH=$(echo $body | jq -r ".[$SELECTION].info_hash")

# You could set your own torrent client here.
#
# Make sure to feed your torrent client with the INFO_HASH
qbittorrent --skip-dialog=true "$INFO_HASH" &

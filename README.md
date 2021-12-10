# Torrent Searcher

Search torrents with dmenu and apibay.

## Demo

![demo](https://i.imgur.com/KLRpNvf.gif)

## Installation

Make sure to install the required [dependencies](#dependencies)

```bash
$ git clone https://github.com/lastra-dev/torrent-searcher.git
$ cd torrent-searcher
$ sudo make
```

## Usage

### Direct search
```bash
$ torrent-searcher <query>
```
### Dmenu search
```bash
$ torrent-searcher
```

By default, `torrent-searcher` will use qbittorrent  
You can modify the last line of [torrent-searcher.sh](torrent-searcher.sh) to change it to your desired
torrent client.

If you leave the query empty, Torrent Searcher will give you the top 100
torrents available through apibay.

## Dependencies

- qbittorrent (you could change this)
- jq
- curl
- dmenu
- notify-send

## Uninstall

```bash
$ cd torrent-searcher
$ sudo make uninstall
```

## Related Projects

- [pirate-get](https://github.com/vikstrous/pirate-get)  
- [pirokit](https://github.com/Bugswriter/pirokit)

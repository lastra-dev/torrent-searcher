PREFIX := /usr/local

all: install

install:
	cp torrent-searcher.sh $(DESTDIR)$(PREFIX)/bin/torrent-searcher
	chmod 0755 $(DESTDIR)$(PREFIX)/bin/torrent-searcher

uninstall:
	$(RM) $(DESTDIR)$(PREFIX)/bin/torrent-searcher

.PHONY: all install uninstall

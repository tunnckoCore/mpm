
BIN ?= mpm
PREFIX ?= /usr/local

install:
	cp mpm.sh $(PREFIX)/bin/$(BIN)
	sudo chmod +x $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)

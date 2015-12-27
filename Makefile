
BIN ?= mpm
PREFIX ?= /usr/local

install:
	sudo chmod +x mpm.sh
	cp mpm.sh $(PREFIX)/bin/$(BIN)

uninstall:
	rm -f $(PREFIX)/bin/$(BIN)

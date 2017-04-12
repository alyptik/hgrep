#
# hgrep - A simple Perl script to quickly search header files in /usr/include using keywords or regular expressions.
#
# See LICENSE file for copyright and license details.

TARGET = "hgrep"

MAN = $(TARGET).7
SRC = $(TARGET)

PREFIX ?= /usr/local

all:
	gzip -c $(MAN) > $(MAN).gz

install: all
	mkdir -p $(PREFIX)/bin
	mkdir -p $(PREFIX)/man/man7/
	cp -f $(SRC) $(PREFIX)/bin
	cp -f $(MAN).gz $(PREFIX)/man/man7/
	chmod 755 $(PREFIX)/bin/$(SRC)

uninstall:
	rm -f $(PREFIX)/bin/$(TARGET)
	rm -f $(PREFIX)/man/man7/$(MAN).gz

clean:
	rm -f $(MAN).gz

.PHONY: all install uninstall clean

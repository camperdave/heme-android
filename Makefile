INSTALL_PREFIX = /usr/local
CFLAGS = -Wall 	# remove -DHAVE_MMAP if you don't have mmap
LDFLAGS = -lncurses
OBJECTS = heme.o xmalloc.o error.o pconfig.o pgetopt.o
TARGET = heme


$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS) 

.c.o:
	$(CC) $(CFLAGS) -c $< -o $@

install: $(TARGET)
	install -s -m 0755 $(TARGET) $(INSTALL_PREFIX)/bin
	install -m 0644 heme.1 $(INSTALL_PREFIX)/man/man1

uninstall:
	rm -f $(INSTALL_PREFIX)/bin/$(TARGET)
	rm -f $(INSTALL_PREFIX)/man/man1/heme.1

clean:
	rm -f *~ *.o $(TARGET)

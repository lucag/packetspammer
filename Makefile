packetspammer: packetspammer.o
	clang -o packetspammer -lpcap -lradiotap -L $(HOME)/.local/lib -rpath $(HOME)/.local/lib packetspammer.o

packetspammer.o: packetspammer.c
	clang -std=c99 -I $(HOME)/.local/include  -Wall -c packetspammer.c

clean:
	rm -f packetspammer *.o

send:	packetspammer
	scp packetspammer root@192.168.0.60:/usr/local/bin
#	scp packetspammer root@192.168.0.99:/usr/local/bin

install:
	mkdir -p $(DESTDIR)/usr/bin
	cp packetspammer $(DESTDIR)/usr/bin

style:
	cstyle packetspammer.c radiotap.c

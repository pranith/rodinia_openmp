all: avimod.o avilib.o

CFLAGS =

ifeq ($(STATIC), 1)
	CFLAGS += --static
endif

# compile supporting function file into object (binary)
avimod.o: avilib.h avimod.c 
	$(CC) $(CFLAGS) -c avimod.c

# compile supporting function file into object (binary)
avilib.o: avilib.h avilib.c
	$(CC) $(CFLAGS) -c avilib.c

# delete files
clean:
	rm *.o *.out

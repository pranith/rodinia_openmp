
ifdef OUTPUT
override OUTPUT = -DOUTPUT
endif

CFLAGS = -lm -O3 -fopenmp

ifeq ($(STATIC), 1)
	CFLAGS += --static
endif

# link objects(binaries) together
heartwall: main.o ./AVI/avilib.o ./AVI/avimod.o
	$(CC) main.o ./AVI/avilib.o ./AVI/avimod.o $(CFLAGS) -o heartwall

# compile main function file into object (binary)
main.o: main.c define.c kernel.c
	$(CC) $(OUTPUT) main.c -I./AVI -c $(CFLAGS)

./AVI/avilib.o ./AVI/avimod.o:
	cd AVI; CC=$(CC) STATIC=$(STATIC) make;

# delete all object files
clean:
	rm -f *.o AVI/*.o heartwall

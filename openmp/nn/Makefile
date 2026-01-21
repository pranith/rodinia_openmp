CC ?= gcc
CFLAGS = -O3 -lm -fopenmp -Wall

ifeq ($(STATIC), 1)
	CFLAGS += --static
endif

all : nn

clean :
	rm -rf *.o nn

nn : nn_openmp.c
	$(CC) -o $@ $< $(LDFLAGS) $(CFLAGS) 

hurricane_gen : hurricane_gen.c
	$(CC) $(CFLAGS) -o $@ $< -lm


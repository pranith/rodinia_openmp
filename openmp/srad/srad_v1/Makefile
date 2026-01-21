# Example
# target: dependencies
	# command 1
	# command 2
          # .
          # .
          # .
	# command n
CC ?= gcc
CFLAGS = -lm -fopenmp -O3

ifeq ($(STATIC), 1)
	CFLAGS += --static
endif

# link objects(binaries) together
a.out:	main.o
	$(CC)	main.o \
			$(CFLAGS) -o srad

# compile main function file into object (binary)
main.o: 	main.c \
				define.c \
				graphics.c
	$(CC)	-c main.c \
			$(CFLAGS)

# delete all object files
clean:
	rm *.o srad

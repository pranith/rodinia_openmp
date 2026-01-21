# Example
# target: dependencies
	# command 1
	# command 2
          # .
          # .
          # .
	# command n
ifdef OUTPUT
override OUTPUT = -DOUTPUT
endif

CC ?= gcc
OMP_LIB = -lgomp
OMP_FLAG = -fopenmp
CFLAGS = -O3

ifeq ($(STATIC), 1)
	CFLAGS += --static
endif

# link objects (binaries) together
a.out:		main.o \
			./kernel/kernel_cpu.o \
			./util/num/num.o \
			./util/timer/timer.o
	$(CC)	main.o \
			./kernel/kernel_cpu.o \
			./util/num/num.o \
			./util/timer/timer.o \
			-lm \
			$(OMP_LIB) \
			-o lavaMD
# compile function files into objects (binaries)
main.o:		main.h \
			main.c \
			./kernel/kernel_cpu.h \
			./kernel/kernel_cpu.c \
			./util/num/num.h \
			./util/num/num.c \
			./util/timer/timer.h \
			./util/timer/timer.c
	$(CC)	${OUTPUT} main.c \
			-c \
			-o main.o \
			$(CFLAGS)	

./kernel/kernel_cpu.o:	./kernel/kernel_cpu.h \
						./kernel/kernel_cpu.c
	$(CC)				./kernel/kernel_cpu.c \
						-c \
						-o ./kernel/kernel_cpu.o \
						$(CFLAGS) \
						$(OMP_FLAG)

./util/num/num.o:	./util/num/num.h \
					./util/num/num.c
	$(CC)			./util/num/num.c \
					-c \
					-o ./util/num/num.o \
					$(CFLAGS)

./util/timer/timer.o:	./util/timer/timer.h \
						./util/timer/timer.c
	$(CC)				./util/timer/timer.c \
						-c \
						-o ./util/timer/timer.o \
						$(CFLAGS)	

# delete all object and executable files
clean:
	rm	*.o \
		./kernel/*.o \
		./util/num/*.o \
		./util/timer/*.o \
                ./util/device/*.o \
		lavaMD

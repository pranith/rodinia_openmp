#makefile
CFLAGS = -O3 -ffast-math -fopenmp
LDFLAGS = -lm

ifeq ($(STATIC), 1)
	CFLAGS += --static
endif


openmp: ex_particle_OPENMP_seq.c
	$(CC) $(CFLAGS) ex_particle_OPENMP_seq.c -o particle_filter $(LDFLAGS)

clean:
	rm particle_filter

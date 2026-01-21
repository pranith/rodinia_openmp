all: OpenMP/leukocyte

OpenMP/leukocyte:
	cd OpenMP; CC=$(CC) STATIC=$(STATIC) make

clean:
	cd OpenMP; make clean
	rm -f meschach_lib/meschach.a

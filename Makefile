include common/make.config

RODINIA_BASE_DIR := $(shell pwd)

OMP_BIN_DIR := $(RODINIA_BASE_DIR)/bin/linux/omp

OMP_DIRS  := backprop bfs cfd heartwall hotspot kmeans lavaMD leukocyte lud nn nw srad streamcluster particlefilter pathfinder # mummergpu

ifeq ($(ARM64), 1)
	CC = aarch64-linux-gnu-gcc
	CXX = aarch64-linux-gnu-g++
else
	CC = gcc
	CXX = g++
endif

ifeq ($(STATIC), 1)
	STATIC=1
else
	STATIC=0
endif
     

all: OMP

OMP:
	@mkdir -p $(OMP_BIN_DIR)
	cd openmp/backprop;				CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp backprop $(OMP_BIN_DIR)
	cd openmp/bfs; 					CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp bfs $(OMP_BIN_DIR)
	cd openmp/cfd; 					CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp euler3d_cpu euler3d_cpu_double pre_euler3d_cpu pre_euler3d_cpu_double $(OMP_BIN_DIR)
	cd openmp/heartwall;  				CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp heartwall $(OMP_BIN_DIR)
	cd openmp/hotspot; 				CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp hotspot $(OMP_BIN_DIR)
	cd openmp/kmeans/kmeans_openmp;			CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp kmeans $(OMP_BIN_DIR)
	cd openmp/lavaMD;				CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp lavaMD $(OMP_BIN_DIR)
	cd openmp/leukocyte;  				CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp OpenMP/leukocyte $(OMP_BIN_DIR)
	cd openmp/lud; 					CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp omp/lud_omp $(OMP_BIN_DIR)
	cd openmp/nn;					CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp nn $(OMP_BIN_DIR)
	cd openmp/nw; 					CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp needle $(OMP_BIN_DIR)
	cd openmp/srad/srad_v1; 			CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp srad $(OMP_BIN_DIR)/srad_v1
	cd openmp/srad/srad_v2; 			CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp srad $(OMP_BIN_DIR)/srad_v2
	cd openmp/streamcluster;			CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp sc_omp $(OMP_BIN_DIR)
	cd openmp/particlefilter;			CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp particle_filter $(OMP_BIN_DIR)
	cd openmp/pathfinder;				CC=$(CC) CXX=$(CXX) STATIC=$(STATIC) make;	cp pathfinder $(OMP_BIN_DIR)
#	cd openmp/mummergpu;  				make;	cp bin/mummergpu $(OMP_BIN_DIR)

clean: OMP_clean

OMP_clean:
	cd $(OMP_BIN_DIR) && rm -f *
	for dir in $(OMP_DIRS) ; do cd openmp/$$dir ; make clean ; cd ../.. ; done

# C compiler
CXX ?= g++
CC_FLAGS = -g -fopenmp -O2

ifeq ($(STATIC), 1)
	CC_FLAGS += --static
endif

all: bfs bfs_offload

bfs: bfs.cpp 
	$(CXX) $(CC_FLAGS) bfs.cpp -o bfs 

bfs_offload: bfs.cpp
	$(CXX) $(CC_FLAGS) -DOMP_OFFLOAD bfs.cpp -o bfs_offload

clean:
	rm -f bfs bfs_offload result.txt

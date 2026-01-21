# C compiler
CXX ?= g++
CC_FLAGS = -g -fopenmp -O2 -lm

ifeq ($(STATIC), 1)
	CC_FLAGS += --static
endif

bfs: 
	$(CXX) $(CC_FLAGS) srad.cpp -o srad 

clean:
	rm -f srad

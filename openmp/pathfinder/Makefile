CXX ?= g++
SRC = pathfinder.cpp
EXE = pathfinder
CFLAGS = -fopenmp

ifeq ($(STATIC), 1)
	CFLAGS += --static
endif

release:
	$(CXX) $(SRC) $(CFLAGS) -o $(EXE)

debug:
	$(CXX) $(SRC) -g -Wall -o $(EXE)

clean:
	rm -f pathfinder



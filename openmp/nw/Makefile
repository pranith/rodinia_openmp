# C compiler
CXX = g++
CC_FLAGS = -g -O3 -fopenmp
OFFLOAD_CC_FLAGS = -offload-option,mic,compiler,"-no-opt-prefetch"

.phony: all

all: needle needle_offload

needle: 
	$(CXX) $(CC_FLAGS) needle.cpp -o needle 

needle_offload:
	$(CXX) $(CC_FLAGS) $(OFFLOAD_CC_FLAGS) -DOMP_OFFLOAD needle.cpp -o needle_offload

clean:
	rm -f needle needle_offload

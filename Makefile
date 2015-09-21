#CC=clang++
#CC=g++
CFLAGS=-c -std=c++0x -O0 -g3 -Wall -I/usr/src/procps
LDFLAGS=-lcec -ldl -lboost_program_options -llog4cplus -L/usr/src/procps/proc/ -lproc-3.2.8 -Wl,-rpath=/usr/src/procps/proc/
EXECUTABLE=libcec-daemon
SOURCES=src/main.cpp src/uinput.cpp src/libcec.cpp
OBJECTS=$(SOURCES:.cpp=.o)

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDFLAGS) -o $@

.cpp.o:
	$(CXX) $(CFLAGS) $< -o $@

clean:
	rm -f $(OBJECTS) $(EXECUTABLE)

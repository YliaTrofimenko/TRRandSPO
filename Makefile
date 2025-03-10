# Compiler
CXX = g++

CXXFLAGS = -Wall -Wextra -std=c++17 -Iinclude
SRCS = find_max.cpp
OBJS = $(SRCS:.cpp=.o)
TARGET = my_program
INSTALL_DIR = /usr/local/bin

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

install: $(TARGET)
	cp $(TARGET) $(INSTALL_DIR)

.PHONY: all clean install


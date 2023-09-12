# Makefile for Tetris Game

CC = g++
CFLAGS = -Wall -std=c++11
LIBS = -l ncurses

SRC_DIR = src
INCLUDE_DIR = include
TEST_DIR = test
BUILD_DIR = build

SRCS = $(wildcard $(SRC_DIR)/*.cpp)
INCLUDES = -I $(INCLUDE_DIR)
OBJS = $(patsubst $(SRC_DIR)/%.cpp,$(BUILD_DIR)/%.o,$(SRCS))
TARGET = tetris

.PHONY: all test clean run

all: $(BUILD_DIR)/$(TARGET)

$(BUILD_DIR)/$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $(INCLUDES) $^ -o $@ $(LIBS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@

test: $(BUILD_DIR)/$(TARGET)
	@$(TEST_DIR)/run_tests.sh

clean:
	rm -rf $(BUILD_DIR)

run:
	@$(BUILD_DIR)/$(TARGET)
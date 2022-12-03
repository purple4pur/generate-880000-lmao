# default target
target = cpp

COMP = g++
ifeq ($(target),c)
  COMP = gcc
endif

.PHONY: all help run build gen clean
help:
	@cat help.txt

all: run

run: code.$(target).exe
	./$^

build: code.$(target).exe
code.$(target).exe: code.$(target)
	@echo "********************************************"
	@echo "This compiling may consume more than 30 mins"
	@echo "on low-spec computers. Good luck!"
	@echo "********************************************"
	$(COMP) $^ -o $@ -O0

gen: code.$(target)
code.$(target): gen.py
	python $^ $(target) $(d)

clean:
	-rm -rf code.cpp code.cpp.exe
	-rm -rf code.c code.c.exe

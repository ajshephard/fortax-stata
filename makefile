ifeq ($(BUILD),)
	BUILD=release
endif

ifeq ($(F90),)
	F90=ifort
endif

ifeq ($(CPP),)
	CPP = g++
endif

FORTAX = ../fortax-library
FORTAXMOD = $(FORTAX)/$(F90).$(BUILD)/
FORTAXLIB = $(FORTAXMOD)/fortax.a

ifeq ($(F90),ifort)
	FFLAGS = -fpp -fPIC -sox -stand f18
	ifeq ($(BUILD),release)
		FFLAGS += -O3 -inline speed -inline-forceinline -no-prec-div -diag-disable 5268,7025
	else
		FFLAGS += -O0 -g -traceback -debug extended -check all
	endif
endif #ifort

ifeq ($(F90),gfortran)
	FFLAGS = -cpp -fPIC -ffree-line-length-none -ffree-form -std=f2018 -J$(FORTAXMOD)
	ifeq ($(BUILD),release)
		FFLAGS += -O3
	else
		FFLAGS += -O0 -g
	endif
endif #gfortran

CFLAGS = -O3 -fPIC -Wall -Wno-write-strings -shared -DSYSTEM=OPUNIX
CLIB = -lifcore
FOBJ = fortax_sysdb.o fortax_stata.o

all: fortax_createf90db.out fortax.plugin

fortax.plugin: fortax_sysdb.o fortax_stata.o
	gcc $(CFLAGS) fortax_plugin.cpp stplugin.c $^ $(FORTAXLIB) $(CLIB) -o $@

fortax_sysdb.o:fortax_sysdb.f90 $(FORTAXLIB)
	$(F90) $(FFLAGS) -c $< -I$(FORTAXMOD)

fortax_stata.f90:fortax_stata.fpp
	fypp -I$(FORTAX) $< > $@

fortax_stata.o:fortax_stata.f90 $(FORTAXLIB)
	$(F90) $(FFLAGS) -c $< -I$(FORTAXMOD)

fortax_createf90db.o:fortax_createf90db.f90 $(FORTAXLIB)
	$(F90) $(FFLAGS) -c $< -I$(FORTAXMOD)

fortax_createf90db.out:fortax_createf90db.o $(FORTAXLIB)
	$(F90) $(FFLAGS) $^ -o $@
	./fortax_createf90db.out ../fortax-library/systems/fortax/ systemsf90/

clean:
	rm -f *.o *.mod $(OUTPUT)


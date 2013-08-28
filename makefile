FORTAX = ../fortax-library
FFLAGS = -O3 -fpp -fPIC -xHost -stand f03
CFLAGS = -O3 -fPIC -Wall -Wno-write-strings -shared -DSYSTEM=OPUNIX
F90 = ifort
CPP = g++
CLIB = -lifcore
FOBJ = fortax_sysdb.o fortax_stata.o

all: fortax_createf90db.out fortax.plugin

fortax.plugin: fortax_sysdb.o fortax_stata.o
	$(CPP) $(CFLAGS) fortax_plugin.cpp stplugin.c $^ $(FORTAX)/fortax.a $(CLIB) -o $@

fortax_sysdb.o:fortax_sysdb.f90 $(FORTAX)/fortax.a
	$(F90) $(FFLAGS) -c $< -I$(FORTAX)

fortax_stata.o:fortax_stata.f90 $(FORTAX)/fortax.a
	$(F90) $(FFLAGS) -c $< -I$(FORTAX)

fortax_createf90db.o:fortax_createf90db.f90 $(FORTAX)/fortax.a
	$(F90) $(FFLAGS) -c $< -I$(FORTAX)

fortax_createf90db.out:fortax_createf90db.o $(FORTAX)/fortax.a
	$(F90) $(FFLAGS) $^ -o $@

clean:
	rm -f *.o *.mod $(OUTPUT)


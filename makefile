CC=cc
CFLAGS=-O3 -Minline=levels:5

all: cpu acc omp

cpu:
	$(CC) $(CFLAGS) src/geometry.c src/fileio.c src/fluid.c -o sph-cpu.out
acc:
	$(CC) $(CFLAGS) -acc -Minfo=acc src/geometry.c src/fileio.c src/fluid.c -o sph-acc.out
omp:
	$(CC) $(CFLAGS) -mp src/geometry.c src/fileio.c src/fluid.c -o sph-omp.out

clean:
	rm -rf *.o *.out 

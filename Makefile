all: cudasvd
cudasvd: svd_example.o
	g++ -o cudasvd svd_example.o -L/usr/local/cuda/lib64 -lcudart -lcublas -lcusolver
svd_example.o: svd_example.cu
	nvcc -c -I/usr/local/cuda/include svd_example.cu
clean: cudasvd svd_example.o
	rm cudasvd svd_example.o
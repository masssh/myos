build:
	make -r build/myos.img
run: build/myos.img
	qemu-system-i386 build/myos.img

build/myos.img: src/bootloader.s Makefile
	./build.sh

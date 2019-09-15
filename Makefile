build:
	make -r build/myos.img
clean:
	rm -rf build/
run: build/myos.img
	qemu-system-i386 build/myos.img

build/myos.img: src/bootloader.s Makefile
	mkdir -p build/
	nasm -f bin -o build/myos.img src/bootloader.s

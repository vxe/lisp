.PHONY:

ccls:
	cd opt; git clone --depth=1 --recursive https://github.com/MaskRay/ccls
	cd opt/ccls
	cd opt/ccls; cmake -H. -BRelease # This downloads prebuilt clang+llvm from releases.llvm.org
	cp opt/ccls; cmake --build Release

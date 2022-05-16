build/unoptimised.wasm: src/*.odin
	@-mkdir -p build
	odin build src -out:build/unoptimised.wasm -opt:size -no-bounds-check -target:freestanding_wasm32 -no-entry-point -extra-linker-flags:"--import-memory -zstack-size=14752 --initial-memory=65536 --max-memory=65536 --stack-first --lto-O3 --gc-sections --strip-all"

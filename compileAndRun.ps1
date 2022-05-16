# mingw stopped working at global scope for some reason so im doing this
C:\MinGW\bin\mingw32-make
.\wasm-opt.exe -Oz --zero-filled-memory --strip-producers .\build\unoptimised.wasm -o .\build\cart.wasm
Write-Host("SIZE OF BUILD: " + (Get-Item 'C:\Users\krisd\Documents\Programming\wasm4\hello-world\build\cart.wasm').length)
w4 run build/cart.wasm
w4 bundle .\build\cart.wasm --title "Win 4 Fighter" --windows w4f.exe 

# mingw stopped working at global scope for some reason so im doing this
C:\MinGW\bin\mingw32-make
$file = 'C:\Users\krisd\Documents\Programming\wasm4\hello-world\build\cart.wasm'
Write-Host("SIZE OF BUILD: " + (Get-Item $file).length)
w4 run build/cart.wasm
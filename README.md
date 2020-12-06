includes files from qt5e (https://github.com/MGWL/QtE5)

(This assumes you're using x86-64 linux. in theory it should work on other platforms with the right libraries)

## Libraries needed:
- qt version 5.7 or newer
- liblua5.3

apt packages: `qt5-default` and `liblua5.3`

## Instructions:
- `make depends`: download source code dependencies
- `make`: compile
- `make run`: run (required because of custom dynamic libraries)
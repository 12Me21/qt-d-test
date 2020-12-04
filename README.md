includes files from qt5e (https://github.com/MGWL/QtE5)

(This assumes you're using x86-64 linux. in theory it should work on other platforms)
put libQtE5Widgets64.so in a place where dynamic libraries are loaded from, like /usr/lib/ idk. I can't get LD_LIBRARY_PATH to work.
requires Qt version 5.9 or newer

Then run `make` (it will be slow the first time because of qte5.d)

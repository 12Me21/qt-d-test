import qte5;
import core.runtime;
import std.stdio;
import derelict.lua.lua;

void test() {
	writeln("clicked");
}

int main(string[] args) {
	DerelictLua.load();
	if (LoadQt(dll.QtE5Widgets, true)) return 1;

	auto app = new QApplication(&Runtime.cArgs.argc, Runtime.cArgs.argv, 1);
	auto window = new QMainWindow(null);

	auto button = new QPushButton("Hello &World", window);
	auto act = new QAction(window, &test, window.aThis);
	window.connects(button, "clicked()", act, "Slot()");
	
	window.resize(100, 30);
	window.show();

	return app.exec();
}

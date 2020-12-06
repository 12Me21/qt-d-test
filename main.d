import qte5;
import core.runtime;
import std.stdio;
import derelict.lua.lua;

void test() {
	lua_State* l = luaL_newstate();
	luaL_openlibs(l);
	int status = luaL_loadfile(l, "script.lua");
	if (status) {
		writeln("lua load failed");
	}
	int result = lua_pcall(l, 0, LUA_MULTRET, 0);
	if (result) {
		writeln("lua run failed");
	}
	lua_close(l);
}

int main(string[] args) {
	DerelictLua.load();
	if (LoadQt(dll.QtE5Widgets, !true)) return 1;

	auto app = new QApplication(&Runtime.cArgs.argc, Runtime.cArgs.argv, 1);
	auto window = new QMainWindow(null);

	auto button = new QPushButton("Run script.lua", window);
	auto act = new QAction(window, &test, window.aThis);
	window.connects(button, "clicked()", act, "Slot()");
	
	window.resize(100, 30);
	window.show();

	app.exec();
	
	return 0;
}

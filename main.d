import qte5;
import core.runtime;

int main(string[] args) {
	if (LoadQt(dll.QtE5Widgets, true)) return 1;
	QApplication app = new QApplication(&Runtime.cArgs.argc, Runtime.cArgs.argv, 1);
	QMainWindow window = new QMainWindow(null);
	
	window.resize(100, 20);
	window.show();
	return app.exec();
}

import sys
import os
import lib.main_rc
from PyQt5.QtCore import QUrl
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

def ready(object, url):
    if not object:
        print("Remote view could not be loaded")
        sys.exit(-1)

def warnings(warnings):
    print("Warnings", warnings)

if __name__ == "__main__":
    sys_argv = sys.argv
    sys_argv += ['--style', 'material']
    app = QGuiApplication(sys.argv)
    remoteview = "https://raw.githubusercontent.com/Artanidos/PythonAndroidBook/master/DynPy/remote/view.qml"
    engine = QQmlApplicationEngine()
    engine.objectCreated.connect(ready)
    engine.warnings.connect(warnings)
    engine.load(QUrl(remoteview))
    sys.exit(app.exec())
    
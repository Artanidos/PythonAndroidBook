import sys
import os
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtProperty, pyqtSignal, pyqtSlot


class Bridge(QObject):
    textChanged = pyqtSignal()

    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self._root = None
        self._cwd = os.getcwd()

    def setRoot(self, root):
        self._root = root

    @pyqtProperty(str, notify=textChanged)
    def cwd(self):
        return self._cwd

    @pyqtSlot("QString")
    def message(self, value):
        print(value + " from QML")
        self._root.updateMessage(value + " from Python")


if __name__ == "__main__":
    bridge = Bridge()
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("bridge", bridge)
    engine.load("view.qml")
    roots = engine.rootObjects()
    bridge.setRoot(roots[0])
    if not roots:
        sys.exit(-1)
    sys.exit(app.exec())

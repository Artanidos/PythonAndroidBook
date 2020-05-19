import sys
import os
from PyQt5.QtGui import QGuiApplication, QColor
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtQuick import QQuickView
from PyQt5.QtCore import QUrl, Qt


if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    view = QQuickView()
    view.setSource(QUrl.fromLocalFile("view.qml"))
    view.show()

    item = view.rootObject().findChild(object, name="myRect")
    if (item):
        item.setProperty("color", QColor(Qt.yellow))
    sys.exit(app.exec())

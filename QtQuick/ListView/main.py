import sys
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import Qt, QObject, pyqtProperty, pyqtSignal, pyqtSlot, QAbstractListModel, QModelIndex


class Model(QAbstractListModel):
    def __init__(self, items, parent=None):
        super(Model, self).__init__(parent)
        self._items = items

    def rowCount(self, parent=None):
        return len(self._items)

    def data(self, index, role=None):
        role = role or QModelIndex()

        if role == Qt.UserRole + 0:
            return self._items[index.row()]["age"]

        if role == Qt.UserRole + 1:
            return self._items[index.row()]["name"]

        if role == Qt.UserRole + 2:
            return self._items[index.row()]["town"]


    def roleNames(self):
        return {
            Qt.UserRole + 0: b"itemAge",
            Qt.UserRole + 1: b"itemName",
            Qt.UserRole + 2: b"itemTown",
        }



if __name__ == "__main__":
    items = [
        {
            "age": 43,
            "name": "Hans Meiser",
            "town": "56543 Berlin"
        },
        {
            "age": 67,
            "name": "Boris Müller",
            "town": "24567 Hamburg"
        },
        {
            "age": 34,
            "name": "Jens Schmidt",
            "town": "55651 Berlin"
        },
    ]
    model = Model(items)

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("mymodel", model)
    engine.load("view.qml")
    roots = engine.rootObjects()
    if not roots:
        sys.exit(-1)
    sys.exit(app.exec())
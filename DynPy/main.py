######
## Use this code if you want to load the QML from your phone.
######s
import sys
import os
import lib.main_rc
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine

if __name__ == "__main__":
    sys_argv = sys.argv
    sys_argv += ['--style', 'material']
    app = QGuiApplication(sys.argv)
    view =  "/storage/emulated/0/view.qml"
    if os.path.exists(view):
        # we are trying to load the view dynamically from the root of the storage
        engine = QQmlApplicationEngine(view)
        if not engine.rootObjects():
            sys.exit(-1)
    else:
        # if the attempt to load the local file fails, we load the fallback
        engine = QQmlApplicationEngine(":/view.qml")
        if not engine.rootObjects():
            sys.exit(-1)
    sys.exit(app.exec())



######
## Use this code if you want to load the QML from a github repo instead of your phone.
######
# import sys
# import os
# import lib.main_rc
# from PyQt5.QtCore import QUrl
# from PyQt5.QtGui import QGuiApplication
# from PyQt5.QtQml import QQmlApplicationEngine

# def ready(object, url):
#     if not object:
#         print("Remote view could not be loaded")
#         sys.exit(-1)

# def warnings(warnings):
#     for warn in warnings:
#         print("Warning:", warn.toString())

# if __name__ == "__main__":
#     sys_argv = sys.argv
#     sys_argv += ['--style', 'material']
#     app = QGuiApplication(sys.argv)
#     remoteview = "https://raw.githubusercontent.com/Artanidos/PythonAndroidBook/master/DynPy/remote/view.qml"
#     engine = QQmlApplicationEngine()
#     engine.objectCreated.connect(ready)
#     engine.warnings.connect(warnings)
#     engine.load(QUrl(remoteview))
#     sys.exit(app.exec())
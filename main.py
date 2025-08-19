import sys
import os
from PySide6.QtWidgets import QApplication
from PySide6.QtQml import QQmlApplicationEngine
from PySide6.QtGui import QIcon
from functions import Backend


def resource_path(relative_path):
    """Get absolute path to resource, works in dev and in PyInstaller bundle."""
    if hasattr(sys, '_MEIPASS'):
        return os.path.join(sys._MEIPASS, relative_path)
    return os.path.join(os.path.abspath("."), relative_path)
if __name__ == "__main__":

    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()

    icon_file = resource_path("calc.svg")
    app.setWindowIcon(QIcon(icon_file))

    # Load QML from correct location
    qml_file = resource_path("main.qml")
    engine.load(qml_file)

    if not engine.rootObjects():
        sys.exit(-1)

    root_window = engine.rootObjects()[0]
    backend = Backend(app, root_window)
    engine.rootContext().setContextProperty("py", backend)

    sys.exit(app.exec())


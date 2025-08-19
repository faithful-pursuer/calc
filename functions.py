from PySide6.QtCore import QObject, Slot
import math as m

class Backend(QObject):
    values = []
    def __init__(self, app, window):
        super().__init__()
        self.app = app
        self.win = window

    @Slot(str)
    def CloseButtonFunction(self, msg):
        print(f"Message: {msg}")
        self.app.quit()

    @Slot(str)
    def MinimizeButtonFunction(self, msg):
        print(f"Message: {msg}")
        self.win.showMinimized()

    @Slot(str)
    def insert(self, value):
        self.values.append(value)
        print(self.values)

    @Slot()
    def AC(self):
        self.values.clear()
        print(self.values)

    @Slot()
    def Del(self):
        self.values.pop()
        print(self.values)

    @Slot(result = str)
    def calculate(self):
        try:
            result = eval("".join(self.values))
            self.values.clear()
            self.values.extend(list(str(result)))
            print(self.values, result)
            return f"{result}"
        except ValueError:
            return "Enter numbers only"
        except Exception as e:
            return "_ Syntax Error _ << AC >>"

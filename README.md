# Calc >> — PySide6 + QML

A modern, animated scientific calculator built with **PySide6 + QML**. Smooth transitions, subtle motion, and a clean dark theme make everyday math feel… nicer.

> ✅ Desktop app • 🎛️ Scientific functions • 🎥 Animated UI

---

## Preview
<img width="305" height="473" alt="image" src="https://github.com/user-attachments/assets/ca52d566-5b28-4aa0-83fd-81e3b8e3ea3d" />
<img width="305" height="473" alt="image" src="https://github.com/user-attachments/assets/c7f57223-ce36-49e3-ab76-0647162f6ad7" />
<img width="305" height="473" alt="image" src="https://github.com/user-attachments/assets/26d8cca5-ff77-4a4d-a3ee-4729fd36a697" />
<img width="305" height="473" alt="image" src="https://github.com/user-attachments/assets/1eeaf58b-beea-42b5-96ae-5276d028e37a" />
<img width="305" height="473" alt="image" src="https://github.com/user-attachments/assets/70b1d85b-fbcd-479b-94a3-28a022b78a31" />
<img width="305" height="473" alt="image" src="https://github.com/user-attachments/assets/7e54ac11-d792-4fba-a773-d5fbc8496619" />



---

## Features

* **Scientific calculator**: parentheses, constants (π), powers, roots, trig, logs, factorial, and more.
* **Smooth transitions**: button hover/press animations, panel slides, and subtle state changes (pure QML).
* **Separation of concerns**: business logic in Python, presentation in QML.

---

## Tech Stack

* **Python** + **PySide6** (Qt for Python)
* **QML/QtQuick** (UI, animations, transitions)
* **QtQuick.Controls** (buttons, inputs)

---

## Project Structure (suggested)

```
calc-qml/
    ├─ main.py              # App entry; sets up engine and bridges to QML
    ├─ functions.py         # All functoion related to the Calculations
    └─ main.qml             # Main Gui file 
```

---

## Getting Started

### 1) Prerequisites

* Python 3.10+
* pip / venv

### 2) Setup

```bash
# clone repo first
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\\Scripts\\activate
pip install PySide6 
pip install pyinstaller  # optional if u want to build it yourself
```

### 3) Run

```bash
python main.py
```
---

## Packaging (PyInstaller)

Create a self‑contained executable. Update paths for your project layout and add every QML dir as data.

```bash
Linux: pyinstaller --name Calc --onefile main.py  --add-data "main.qml:."  --add-data "calc.svg:."  --nocolsole --noupx
MacOS: pyinstaller --name Calc --onefile main.py  --add-data "main.qml:."  --add-data "calc.svg:."  --windowed --noupx
windows: pyinstaller --name Calc --onefile main.py --add-data "main.qml;." --add-data "calc.svg;." --icon=calc.ico  --nocolsole --noupx

```

---



## Troubleshooting

* **Blank window** → confirm QML path passed to `engine.load(...)` is correct.
* **Icons or QML missing in build** → check PyInstaller `--add-data` entries.
* **High CPU on hover** → reduce `NumberAnimation` duration or remove heavy `ShaderEffect`s.

---

## Roadmap

* [ ] History panel with swipe/slide transition
* [ ] Light theme toggle
* [ ] Localized number formats
* [ ] Unit conversion mode
* [ ] Keyboard support
* [ ] Graph mode

---


## License

MIT © 2025 Faithful Pursuer

---

## Credits

Built with ❤️ by Faithful Pursuer

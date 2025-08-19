import QtQuick 
import QtQuick.Controls 
import QtQuick.Layouts

ApplicationWindow {
    id: win
    visible: true
    width: 300
    height: 470
    color: "transparent"
    flags: Qt.FramelessWindowHint


    Rectangle {
        id: main
        anchors.fill: parent
        color: "#1f1f1f"
        radius: 15
        border {
            color : "#8a8a8a7a"
            width: 2
            }
        opacity: 0.95
        }

    Rectangle {
        id: spacer        // invisible spacer
        anchors.top: dragBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        // height: 2
        color: "transparent"
        }

    Rectangle {
        id: frame
        anchors.top: spacer.bottom   // now sits 30 px below dragBar
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 7
        color: "#0f0f0f"
        opacity: 0.97
        radius: 15
        border {
            color : "#8a8a8a7a"
            width: 1
            }
        
        Rectangle {
            id: inputparent
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                margins: 5
            }
            color: "#242424"
            height: 35
            radius: 12
            border.width: 1
            border.color: "#8a8a8a7a"

            TextField {
                id: textinput
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    margins: 3
                    }
                height: 29
                placeholderText: "Equation"
                placeholderTextColor: "#434242"
                font.pixelSize: 14
                font.family: "Cascadia Code"
                selectionColor: "#471a27"
                selectedTextColor: "#b14363"
                background: Rectangle {
                    color: "#1a1a1a"
                    radius: 11
                    // border.width: focused ? 2 : 1
                    // border.color: focused ? "#4CAF50" : "#555555"
                    // color: focused ? "#1a1a1a" : "#2e2e2e"
                    }

                Behavior on opacity { NumberAnimation { duration: 100 } }

                function setTextAnimated(v) {
                    opacity = 0
                    // wait for the fade-out to finish, then swap text & fade-in
                    opacityAnim.onStopped.connect(() => { text = v; opacity = 1 })
                    opacityAnim.start()
                    }

                PropertyAnimation {
                    id: opacityAnim
                    target: textinput
                    property: "opacity"
                    duration: 150
                    }

                }   
            }
            
            Rectangle {
                id: buttonparent
                anchors {
                    top: inputparent.bottom
                    left: parent.left
                    right: parent.right
                    bottom: parent.bottom
                    margins: 8
                    }
                color: "#1a1a1a"
                radius: 12
                border.width: 1
                border.color: "#8a8a8a7a"

                GridLayout {
                    id: buttonGrid
                    anchors {
                        top: parent.top
                        left: parent.left
                        right: parent.right
                        bottom: parent.bottom
                        margins: 5
                        }
                    columns: 5
                    rowSpacing: 8
                    columnSpacing: 8

            // ======= row 1
                    Rectangle {
                        id: butt1
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "1"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "1"
                                py.insert("1")
                                }
                            onPressed: butt1.scale = 0.95
                            onReleased: butt1.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt2
                        // Layout.columnSpan: 2
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "2"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "2"
                                py.insert("2")
                                }
                            onPressed: butt2.scale = 0.95
                            onReleased: butt2.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt3
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "3"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "3"
                                py.insert("3")
                                }
                            onPressed: butt3.scale = 0.95
                            onReleased: butt3.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt4
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#322a2a"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "+"
                            font.pixelSize: 25
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += " + "
                                py.insert("+")
                                }
                            onPressed: butt4.scale = 0.9
                            onReleased: butt4.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt5 
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#322a2a"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "-"
                            font.pixelSize: 30
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += " - "
                                py.insert("-")
                                }
                            onPressed: butt5.scale = 0.9
                            onReleased: butt5.scale = 1
                            }
                        }

            // ======= row 2

                    Rectangle {
                        id: butt6
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "4"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "4"
                                py.insert("4")
                                }
                            onPressed: butt6.scale = 0.95
                            onReleased: butt6.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt7
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "5"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "5"
                                py.insert("5")
                                }
                            onPressed: butt7.scale = 0.95
                            onReleased: butt7.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt8
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "6"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "6"
                                py.insert("6")
                                }
                            onPressed: butt8.scale = 0.95
                            onReleased: butt8.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt9
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#322a2a"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "×"
                            font.pixelSize: 25
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += " × "
                                py.insert("*")
                                }
                            onPressed: butt9.scale = 0.9
                            onReleased: butt9.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt10
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#322a2a"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "÷"
                            font.pixelSize: 25
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += " ÷ "
                                py.insert("/")
                                }
                            onPressed: butt10.scale = 0.9
                            onReleased: butt10.scale = 1
                            }
                        }

            // ======= row 3
        
                    Rectangle {
                        id: butt11
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "7"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "7"
                                py.insert("7")
                                }
                            onPressed: butt11.scale = 0.95
                            onReleased: butt11.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt12
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "8"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "8"
                                py.insert("8")
                                }
                            onPressed: butt12.scale = 0.95
                            onReleased: butt12.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt13
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "9"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "9"
                                py.insert("9")
                                }
                            onPressed: butt13.scale = 0.95
                            onReleased: butt13.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt14
                        Layout.columnSpan: 2
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#312e33"
                        radius: 20
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "="
                            font.pixelSize: 30
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.setTextAnimated(py.calculate())
                                // py.calculate()
                                }
                            onPressed: butt14.scale = 0.85
                            onReleased: butt14.scale = 1
                            }
                        }

            // ======= row 4

                    Rectangle {
                        id: butt15
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 12
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "."
                            font.pixelSize: 30
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "."
                                py.insert(".")
                                }
                            onPressed: butt15.scale = 0.95
                            onReleased: butt15.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt16
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 15
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "0"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "0"
                                py.insert("0")
                                }
                            onPressed: butt16.scale = 0.95
                            onReleased: butt16.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt17
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#242424"
                        radius: 12
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "π"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "π"
                                py.insert("m.pi")
                                }
                            onPressed: butt17.scale = 0.95
                            onReleased: butt17.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt18
                        Layout.columnSpan: 2
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#3b3030"
                        radius: 20
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "AC"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text = ""
                                py.AC()
                                }
                            onPressed: butt18.scale = 0.85
                            onReleased: butt18.scale = 1
                            }
                        }

            // ======= row 5

                    Rectangle {
                        id: butt19
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2a27"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "x²"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "²"
                                py.insert("**2")
                                }
                            onPressed: butt19.scale = 0.95
                            onReleased: butt19.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt20
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2927"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "√x"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "√("
                                py.insert("m.sqrt(")
                                }
                            onPressed: butt20.scale = 0.95
                            onReleased: butt20.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt21
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2727"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "sin"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "sin("
                                py.insert("m.sin(")
                                }
                            onPressed: butt21.scale = 0.95
                            onReleased: butt21.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt22
                        Layout.columnSpan: 2
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#332828"
                        radius: 20
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "Del"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text.slice(0, -1)
                                py.Del()
                                }
                            onPressed: butt22.scale = 0.85
                            onReleased: butt22.scale = 1
                            }
                        }

                // ====== row 6

                    Rectangle {
                        id: butt23
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2a27"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "x³"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "³"
                                py.insert("**3")
                                }
                            onPressed: butt23.scale = 0.95
                            onReleased: butt23.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt24
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2927"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "∛x"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "^∛("
                                py.insert("m.cbrt(")
                                }
                            onPressed: butt24.scale = 0.95
                            onReleased: butt24.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt25
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2727"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "cos"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "cos("
                                py.insert("m.cos(")
                                }
                            onPressed: butt25.scale = 0.95
                            onReleased: butt25.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt26
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#272e2f"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "("
                            font.pixelSize: 20
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "("
                                py.insert("(")
                                }
                            onPressed: butt26.scale = 0.95
                            onReleased: butt26.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt27
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#272e2f"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: ")"
                            font.pixelSize: 20
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += ")"
                                py.insert(")")
                                }
                            onPressed: butt27.scale = 0.95
                            onReleased: butt27.scale = 1
                            }
                        }

                // ===== row 7

                    Rectangle {
                        id: butt28
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2a27"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "xʸ"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "^("
                                py.insert("**(")
                                }
                            onPressed: butt28.scale = 0.95
                            onReleased: butt28.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt29
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2927"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "x⁻¹"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "⁻¹"
                                py.insert("**-1")
                                }
                            onPressed: butt29.scale = 0.95
                            onReleased: butt29.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt30
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2f2727"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "tan"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "tan("
                                py.insert("m.tan(")
                                }
                            onPressed: butt30.scale = 0.95
                            onReleased: butt30.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt31
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2c272f"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "!"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "!("
                                py.insert("m.factorial(")
                                }
                            onPressed: butt31.scale = 0.95
                            onReleased: butt31.scale = 1
                            }
                        }

                    Rectangle {
                        id: butt32
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "#2c272f"
                        radius: 8
                        border.width: 1
                        border.color: "#8a8a8a7a"
                        Behavior on scale { NumberAnimation { duration: 80 }}
                        Text {
                            anchors.centerIn: parent
                            text: "logX"
                            font.pixelSize: 15
                            color: "#c17e5c"
                            }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                textinput.text = textinput.text += "log("
                                py.insert("m.log10(")
                                }
                            onPressed: butt32.scale = 0.95
                            onReleased: butt32.scale = 1
                            }
                        }


                    }
                }
            }

// ======= dragbar
    Rectangle {
        id: dragBar
        anchors { 
            top: parent.top
            left: parent.left
            right: parent.right 
            }
        height: 25
        color: "#252325" 
        radius: 15
        border.width: 1
        border.color: "#8a8a8a7a"
        z: 10
        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton
            onPressed: (mouse) => {
                if (mouse.button === Qt.LeftButton)
                    win.startSystemMove()
                }
            }
        
        Rectangle {
            id: titleholder
            anchors {
                left: parent.left
                top: parent.top
                // rightMargin: 4
                }
            width: parent.width - 240
            height: parent.height
            color: "#1b1818"
            radius: 15
            border.width: 1
            border.color: "#8a8a8a7a"

            Behavior on height { 
                NumberAnimation { 
                    duration: 150
                    easing.type: Easing.OutBack 
                    } 
                }
            Behavior on width { 
                NumberAnimation { 
                    duration: 150
                    easing.type: Easing.OutBack 
                    } 
                }

            Behavior on visible { NumberAnimation { duration: 80 }}
            Behavior on scale { NumberAnimation { duration: 80 }}

            MouseArea {
                anchors.fill: parent

                onPressed: {
                    titleholder.scale = 0.9
                    titleholder.height = 100
                    titleholder.width = 130
                    sub0.opacity = 1
                    sub1.opacity = 1
                    sub2.opacity = 1
                    sub3.opacity = 1
                    }
                onReleased: {
                    titleholder.scale = 1
                    titleholder.height = 25
                    titleholder.width = 60
                    sub0.opacity = 0
                    sub1.opacity = 0
                    sub2.opacity = 0
                    sub3.opacity = 0
                    }
                }


            Text {
                id: title
                anchors { 
                    top: parent.top 
                    left: parent.left 
                    margins: 4
                    }     
                text: "  Calc  >>"
                color: "#8a8a8a7a"
                }

            Text {
                id: sub0
                visible: opacity > 0
                font.pixelSize: 1
                anchors { 
                    top: title.bottom
                    left: parent.left 
                    margins: 4
                    }     
                text: " "
                color: "#8a8a8a7a"
                opacity: 0
                Behavior on opacity { NumberAnimation { duration: 80 } }
                }

            Text {
                id: sub1
                visible: opacity > 0
                font.pixelSize: 10
                anchors { 
                    top: sub0.bottom
                    left: parent.left 
                    margins: 4
                    }     
                text: "   Made with ❤️ by"
                color: "#8a8a8a7a"
                opacity: 0
                Behavior on opacity { NumberAnimation { duration: 80 } }
                }

            Text {
                id: sub2
                visible: opacity > 0
                anchors { 
                    top: sub1.bottom
                    left: parent.left 
                    margins: 4
                    }     
                text: "  Faithful Pursuer"
                color: "#8a8a8a7a"
                opacity: 0
                font.pixelSize: 14
                Behavior on opacity { NumberAnimation { duration: 80 } }
                }

            Text {
                id: sub3
                visible: opacity > 0
                anchors { 
                    bottom: parent.bottom
                    // left: parent.left 
                    // centerIn: parent
                    horizontalCenter: parent.horizontalCenter
                    margins: 4
                    }     
                text: "version > 3.0.0"
                color: "#8a8a8a7a"
                opacity: 0
                font.pixelSize: 10
                Behavior on opacity { NumberAnimation { duration: 80 } }
                }

            
        }
        

    Row {
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            rightMargin: 8
            }
        spacing: 8

        Rectangle {
           id: minimizebutton
           z: 20
           width: 12
           height: 12
           radius: 7
           color: "#c2cc33"
           Behavior on scale {NumberAnimation { duration: 80 }}
           MouseArea { 
                anchors.fill: parent 
                onClicked: py.MinimizeButtonFunction("Application Minimized >>> Minimize Button Clicked")
                onPressed: minimizebutton.scale = 0.5
                onReleased: minimizebutton.scale = 1
                }
            }

        Rectangle {
           id: closebutton
           z: 20
           width: 12
           height: 12
           radius: 7
           color: "#ff5f57"
           Behavior on scale {NumberAnimation { duration: 80 }}
           MouseArea { 
                anchors.fill: parent 
                onClicked: py.CloseButtonFunction("Application Closed >>> Close Button Clicked")
                onPressed: closebutton.scale = 0.5
                onReleased: closebutton.scale = 1
                }
            }
        }
    }
}

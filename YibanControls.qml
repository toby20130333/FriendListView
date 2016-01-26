import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

Rectangle {
    width: 360
    height: 30
    signal signalClickType(string btntitle)
    Row{

        Button {
            id:btn1
            text: "易友"
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 80
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
            }
            onClicked: {
               signalClickType(btn1.text);
            }
        }
        Button {
            text: "易友群"
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 80
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
            }
            onClicked: {
               signalClickType(text);
            }
        }
        Button {
            text: "机构群"
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 80
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
            }
            onClicked: {
               signalClickType(text);
            }
        }
        Button {
            text: "聊天记录"
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 80
                    implicitHeight: 25
                    border.width: control.activeFocus ? 2 : 1
                    border.color: "#888"
                    radius: 4
                    gradient: Gradient {
                        GradientStop { position: 0 ; color: control.pressed ? "#ccc" : "#eee" }
                        GradientStop { position: 1 ; color: control.pressed ? "#aaa" : "#ccc" }
                    }
                }
            }
            onClicked: {
               signalClickType(text);
            }
        }
    }
}

import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
//import "logic.js" as Logic
//import "style.js" as Style

Rectangle{
    id : root
    width : 400
    height : 768
    Button {
        text: "A button"
        anchors.centerIn: parent
        style: ButtonStyle {
            background: Rectangle {
                implicitWidth: 100
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
    }

    Text{
        id:x
        text: "\u89e3\u7801\u5931\u8d25"
        anchors.horizontalCenter: parent.horizontalCenter
    }

    MouseArea{
        anchors.fill: root

        onClicked: {
            console.log("save image")
            screenObject.capture("/Users/tobyyi/Desktop/yitb/Qt-App/YibanIM/xxx.jpg")
        }
    }
}

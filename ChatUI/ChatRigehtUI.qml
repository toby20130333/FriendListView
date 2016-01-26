import QtQuick 2.0

Rectangle {
    width: 100
    height: parent.height
    Text {
        id: name
        text: "好友信息\n正在显示中..."
        color: "red"
        anchors.centerIn: parent
        font.pixelSize: 20
    }
    border.width: 2
    border.color: "blue"
    color: "gray"
}

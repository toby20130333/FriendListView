import QtQuick 2.1

Rectangle {
    width: parent.width
    height: 40
    property string headImg: "qrc:/images/arrows_right.png"
    property string headImg_ex: "qrc:/images/arrows_down.png"
    property string headGrouName: "D团队"
    property string headOnlineNums: "[10/20]"
    property bool isExpand: false
    signal signalExpandStatus(bool isexpand);

    Image {
        id: frdHead
        source: isExpand?headImg_ex:headImg
        smooth: true
        width: isExpand?9:5
        height: isExpand?5:10
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: frdName
        text: headGrouName
        height: parent.height
        anchors.left: frdHead.right
        anchors.leftMargin: 10
        verticalAlignment: Text.AlignVCenter
        font.family: "微软雅黑"
    }
    Text {
        id: signContent
        text: "["+headOnlineNums+"]"
        height: parent.height
        anchors.left: frdName.right
        anchors.leftMargin: 10
        verticalAlignment: Text.AlignVCenter
        font.family: "微软雅黑"
        color: "black"
    }
    MouseArea{
        id:ma
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            isExpand = !isExpand;
            signalExpandStatus(isExpand);
        }
        onEntered: {
            color = "#F2F2F2"
        }
        onExited: {
            color = "white"
        }
    }
}

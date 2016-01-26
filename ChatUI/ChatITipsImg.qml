import QtQuick 2.1
import ".././YbTxt.js" as MyTxtJs
Rectangle {
    width: 30
    height: 20
    property string iTxt: ""
    border.width: 1
    border.color: "gray"
    radius: 5
    smooth: true
    opacity: 0.8
    Text{
        id:txt
        text:iTxt
        anchors.centerIn: parent
        font.family: MyTxtJs.textType
        font.pixelSize: 10
        color: "#000000"
    }
    function setCurrentTxt(str)
    {
        iTxt = str;
    }
}

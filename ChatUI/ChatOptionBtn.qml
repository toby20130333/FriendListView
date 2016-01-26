import QtQuick 2.0

Rectangle{
    id:btn1
    width: 30
    height: 20
    border.width: 1
    border.color: "gray"
    property string iChatTxt: "结束"
    signal signalSendTxt(string iSend);

    radius: 5
    Text{
        id:cli1
        text: iChatTxt
        anchors.centerIn: parent
    }

    MouseArea{
        id:ma1
        anchors.fill: parent
//        enabled: edit.text.length?true:false
        hoverEnabled: true
        onClicked: {
//            appendData(edit.text,1);
//            edit.text = "";
//            chatView.positionViewAtEnd();
            signalSendTxt(iChatTxt);
        }
        onEntered: {
            cli1.color = "gray";

        }
        onExited: {
            cli1.color = "black";
        }
    }
}

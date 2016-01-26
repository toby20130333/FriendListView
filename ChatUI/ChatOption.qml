import QtQuick 2.0

Item {
    width: parent.width
    height: 20
    signal signalSendType(int iType)
    Row{
        id:rw
        spacing: 30
        ChatOptionBtn{
            id:emtion
            iChatTxt: "表情"
            onSignalSendTxt: {
                signalSendType(0);
            }
        }

        ChatOptionBtn {
            id: name1
            iChatTxt: "截图"
            onSignalSendTxt: {
                signalSendType(1);
            }
        }
        ChatOptionBtn {
            id: name2
            iChatTxt: "图片"
        }
        ChatOptionBtn {
            id: name3
            iChatTxt: "记录"
        }
        ChatOptionBtn {
            id: name4
            iChatTxt: "屏蔽"
        }
    }
}

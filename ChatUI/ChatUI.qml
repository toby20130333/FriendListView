import QtQuick 2.0
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1
import "./../ybjs.js" as MyJs

Rectangle {
    width: 600
    height: 500
    TabView{
        id:mainView
        anchors.left: parent.left
        anchors.leftMargin: 12
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 2
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 2
        Component.onCompleted: {
            //            addTabView(MyJs.yibanFriend);
        }
        onCurrentIndexChanged: {
            console.log("cccccc"+currentIndex);
        }

//        Tab{
//            id:yibanFrid
//            title: "Yitb"
//            anchors.top: parent.top

//            // [1] Specify the source URL to load the content.
//            source: "ChatView.qml"
//        }
//        Tab{
//            id:yibanQun
//            title: "易友群"
//            anchors.top: parent.top

//            // [1] Specify the source URL to load the content.
//            source: "ChatView.qml"
//        }

//        Tab{
//            id:yibanJigou
//            title: "机构群"
//            anchors.top: parent.top

//            // [1] Specify the source URL to load the content.
//            source: "ChatView.qml"
//        }

//        Tab{
//            id:yibanHistory
//            title: "聊天记录"
//            anchors.top: parent.top
//            // [1] Specify the source URL to load the content.
//            source: "ChatView.qml"
//        }

        style: TabViewStyle {
            frameOverlap: 1
            tab: Rectangle {
                color: styleData.selected ? "steelblue" :"lightsteelblue"
                border.color:  "steelblue"
                implicitWidth: Math.max(text.width + 4, 80)
                implicitHeight: 25
                radius: 2
                Image {
                    id: logo
                    source: "qrc:/images/4.png"
                    width: 25
                    height: 25
                }
                Text {
                    id: text
                    anchors.left: logo.right
                    anchors.leftMargin: 2
                    anchors.verticalCenter: parent.verticalCenter
                    verticalAlignment: Text.AlignVCenter
                    text: styleData.title
                    color: styleData.selected ? "white" : "black"
                }
            }
//            frame: Rectangle { color: "steelblue" }
        }
    }

    Button{
        id:addBtn
        width: 30
        height: 20
        text:"Add"
        anchors.right: parent.right
        anchors.top:parent.top
        onClicked: {
            addTabView(MyJs.yibanFriend);
        }
    }

    function createSpriteObjects(strQml) {
        var component;
        component = Qt.createComponent(strQml);
        var sprite = component.createObject(mainView, {"x": 0, "y": 20});

        if (sprite == null) {
            // Error Handling
            console.log("Error creating object");
        }
        return component;
    }
    function addTabView(strType)
    {
        console.log("addTabView nums "+mainView.count);
        //        return;
        switch(strType)
        {
        case MyJs.yibanFriend:{

            mainView.insertTab(0,strType,createSpriteObjects("ChatView.qml"));
        }
        break;
        }
    }

}

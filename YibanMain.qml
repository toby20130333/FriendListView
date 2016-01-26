import QtQuick 2.1
import QtQuick.Controls 1.1
import QtQuick.Controls.Styles 1.1

import "./ybjs.js" as MyJs

Item {
    width: 360
    height: 600

//    YibanControls{
//        id:btn
//        anchors.left: parent.left
//        anchors.leftMargin: 12
//        anchors.right: parent.right
//        anchors.rightMargin: 10
//        anchors.top: parent.top
//        anchors.topMargin: 2
//        onSignalClickType: {
//            console.log("       "+btntitle);
//            addTabView(btntitle);

//        }
//    }

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
            //addTabView(MyJs.yibanFriend);
        }
        Tab{
            id:yibanFrid
            title: "易友"
            anchors.top: parent.top

            // [1] Specify the source URL to load the content.
            source: "YibanFriend.qml"
        }
        Tab{
            id:yibanQun
            title: "易友群"
            anchors.top: parent.top

            // [1] Specify the source URL to load the content.
            source: "YibanQunView.qml"
        }

        Tab{
            id:yibanJigou
            title: "机构群"
            anchors.top: parent.top

            // [1] Specify the source URL to load the content.
            source: "YibanJigouUI.qml"
        }

        Tab{
            id:yibanHistory
            title: "聊天记录"
            anchors.top: parent.top

            // [1] Specify the source URL to load the content.
            source: "YibanHistory.qml"
        }

        style: TabViewStyle {
                frameOverlap: 1
                tab: Rectangle {
                    color: styleData.selected ? "steelblue" :"lightsteelblue"
                    border.color:  "steelblue"
                    implicitWidth: Math.max(text.width + 4, 80)
                    implicitHeight: 25
                    radius: 2
                    Text {
                        id: text
                        anchors.centerIn: parent
                        text: styleData.title
                        color: styleData.selected ? "white" : "black"
                    }
                }
                frame: Rectangle { color: "steelblue" }
            }
    }

    function createSpriteObjects(strQml) {
        var component;
        component = Qt.createComponent(strQml);
        var sprite = component.createObject(mainView, {"x": 0, "y": 0});

        if (sprite == null) {
            // Error Handling
            console.log("Error creating object");
        }
        return component;
    }
    function addTabView(strType)
    {
        console.log("addTabView nums "+mainView.count);
        return;
        switch(strType)
        {
        case MyJs.yibanFriend:{

            mainView.addTab(strType,createSpriteObjects("YibanFriend.qml"));
        }
        break;
        case MyJs.yibanQun:{
            mainView.addTab(strType,createSpriteObjects("YibanQunView.qml"));
        }break;
        case MyJs.yibanJigou:{

        }break;
        case MyJs.yibanHistory:{

        }break;
        }

    }
}

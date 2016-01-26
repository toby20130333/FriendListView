import QtQuick 2.1
import "./ybjs.js" as MyJs
Item {
    width: 360
    height:!isHide?(yibanVQuniew.count*40+40):(40)
    property ListModel ybfModel
    property string headName: "D团队"
    property string headOnline: "[20]"
    property bool isHide: false
    YibanHeadItem{
        id:head
        anchors.left: parent.left
        anchors.leftMargin: 0
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.top: parent.top
        anchors.topMargin: 0
        headGrouName: headName
        headOnlineNums: getonlineRate()
        onSignalExpandStatus: {
            isHide = isexpand;
            yibanVQuniew.height = isexpand?0:yibanVQuniew.count*40;
        }
    }

    ListView{
        id:yibanVQuniew
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: head.bottom
        anchors.topMargin: 2
        height: yibanVQuniew.count*40
        boundsBehavior: Flickable.StopAtBounds
        delegate: YibanQunItem{
            width: yibanVQuniew.width+20
            qunImg: userphoto
            qunName: username
            qununReadImg: ""
            ispingbi: false
        }
        clip:true
        model: ybfModel
        Behavior on height {
             NumberAnimation { duration: 500 }
        }
        onHeightChanged: {
//            console.log("height?????? "+yibanView.height);
            if(yibanVQuniew.height == 0){
                yibanVQuniew.visible = false;
            }else{
                yibanVQuniew.visible = true;
            }
        }
    }
       function getonlineRate()
    {
        var totalNum = yibanVQuniew.count;
        var str = totalNum;
        return str;
    }
    function getonlineNums()
    {
        var nums=0;
        for(var i =0;i<yibanVQuniew.count;i++)
        {
            if(ybfModel.get(i).isonline == "0")
            {
                nums++;
                console.log("nums ssssssssss "+nums);
                continue;
            }
        }
        return nums;
    }
}

import QtQuick 2.1

Item {
    width: 360
    height:!isHide?(yibanView.count*40+40):(40)
    property ListModel ybfModel
    property string headName: "D团队"
    property string headOnline: "[10/20]"
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
            yibanView.height = isexpand?0:yibanView.count*40;
        }
    }

    ListView{
        id:yibanView
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: head.bottom
        anchors.topMargin: 2
        height: yibanView.count*40
        boundsBehavior: Flickable.StopAtBounds
        delegate: YibanFriendItem{
            width: yibanView.width+20
            friendImg: userphoto
            friendName: username
            fspaceStatus: space_status
            fsignContent: contents_sign
            frdLimit: limit
            online:!isonline
        }
        clip:true
        model: ybfModel
        Behavior on height {
             NumberAnimation { duration: 500 }
        }
        onHeightChanged: {
//            console.log("height?????? "+yibanView.height);
            if(yibanView.height == 0){
                yibanView.visible = false;
            }else{
                yibanView.visible = true;
            }
        }
    }
    function getonlineRate()
    {
        var totalNum = yibanView.count;
        var str = getonlineNums()+"/"+totalNum;
        return str;
    }
    function getonlineNums()
    {
        var nums=0;
        for(var i =0;i<yibanView.count;i++)
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

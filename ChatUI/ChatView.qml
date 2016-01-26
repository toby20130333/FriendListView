import QtQuick 2.0
import QtQuick.XmlListModel 2.0

Item {
    width: 600
    height: 500
//    color: "gray"
    property XmlListModel tmpModel;
    property string atContents: "@zhuditingyu"
    XmlListModel {
        id: xmlModel
        source:"qrc:/ybemxml_new.xml"
        query: "/ybdb/img/item"
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "path"; query: "path/string()" }
        XmlRole { name: "title2"; query: "title2/string()" }
        Component.onCompleted: {
            tmpModel = xmlModel;
        }
    }

    ChatSomeInfo{
        id:topInfo
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top:parent.top
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 12

    }

    ChatRigehtUI{
        anchors.left: viewRect.right
        anchors.right: parent.right
        anchors.top:topInfo.bottom
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 12
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }

    Rectangle{
        id:atSomeBody
        anchors.left: parent.left
        anchors.right: viewRect.right
        anchors.top:viewRect.top
        anchors.leftMargin: 12
        anchors.rightMargin: 12
        anchors.topMargin: 2
        height: 30
        radius: 10
        z:2
        color: "gray"
        opacity: 0.0
        Text {
            id: atName
            text: atContents
//            anchors.centerIn: parent
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            width: parent.width
            height: parent.height
            color: "white"
        }

    }
    SequentialAnimation {
            id:animation
            NumberAnimation { target: atSomeBody; property: "opacity"; to: 0.8; duration: 500 }
            PauseAnimation { duration: 2000 }
            NumberAnimation { target: atSomeBody; property: "opacity"; to: 0; duration: 500 }
        }

    ListModel{
        id:chatModel
        ListElement{
            chatName1:"yitb"
            chatFlag1:0
            chatHead1:"http://img01.nduoa.com/apk/658/658954/icon_72.png"
            chatContents1:"都在干嘛呢?不吭声的都木有JJ daywhat a fuck daywhat a fuck day"
            chatTime1:"1397031550000"
        }

    }

    Rectangle{
        id:viewRect
        anchors.left: parent.left
        anchors.top:topInfo.bottom
        anchors.leftMargin: 10
        anchors.topMargin: 10
        height: parent.height-200
        border.width: 2
        border.color: "green"
        width: 400
        radius: 10
        ListView{
            id:chatView
            width: parent.width-10
            anchors.centerIn: parent
            height: parent.height-10
            spacing:10
            delegate: ChatItem{

                chatName: chatName1
                chatContents: chatContents1
                chatFlag: chatFlag1
                chatHead: chatHead1
                chatTime: chatTime1
                chatIndex: index
            }
            clip:true
            model:chatModel
        }
    }
    ChatBiaoq{
        id:biaoq
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: option.top
        anchors.bottomMargin: 10
        opacity: 0
        visible: false
        onSignalClickCurrentImg: {
            console.log(imgName+" "+strPath);
            edit.text += imgName;
        }
    }
    SequentialAnimation {
        id:animation2
        NumberAnimation { target: biaoq; property: "opacity"; to: 0.8; duration: 500 }
        PauseAnimation { duration: 2000 }
        //NumberAnimation { target: atSomeBody; property: "opacity"; to: 0; duration: 500 }
    }
    SequentialAnimation {
        id:animation3
        NumberAnimation { target: biaoq; property: "opacity"; to: 0.0; duration: 500 }
        PauseAnimation { duration: 2000 }
//        NumberAnimation { target: biaoq; property: "visible"; to: f; duration: 500 }
    }

    ChatOption{
        id:option
        anchors.left: parent.left
        anchors.leftMargin: 10
        width:viewRect.width
        anchors.top:viewRect.bottom
        anchors.topMargin: 2
        onSignalSendType: {
            switch(iType)
            {
            case 0:
            {
                biaoq.visible =true;
                animation2.stop();
                animation2.start();
            }break;
            case 1:
            {

            }break;
            }
        }

    }

    Rectangle{
        id:editRect
        height: 80;
        anchors.left: parent.left
        anchors.leftMargin: 10

        width:viewRect.width
        anchors.top:viewRect.bottom
        anchors.topMargin: 24
        border.width: 1
        border.color: "gray"
        radius: 10

        Flickable {
            id: flick
            width: parent.width-20
            height: parent.height-10
            anchors.centerIn: parent
            contentWidth: edit.paintedWidth
            contentHeight: edit.paintedHeight
            clip: true

            function ensureVisible(r)
            {
                if (contentX >= r.x)
                    contentX = r.x;
                else if (contentX+width <= r.x+r.width)
                    contentX = r.x+r.width-width;
                if (contentY >= r.y)
                    contentY = r.y;
                else if (contentY+height <= r.y+r.height)
                    contentY = r.y+r.height-height;
            }

            TextEdit {
                id: edit
                width: flick.width
                height: flick.height
                focus: true
                wrapMode: TextEdit.Wrap
                onCursorRectangleChanged: flick.ensureVisible(cursorRectangle)
                Keys.onReturnPressed: {
                    appendData(edit.text,0);
                    edit.text = "";
                    chatView.positionViewAtEnd();
                    animation3.stop();
                    animation3.start();
                    biaoq.visible = false;
                }
            }
        }
    }
    ChatScrollBar{
        id:scBar
        anchors.right: viewRect.right
        anchors.rightMargin: 2
        anchors.top: viewRect.top
        anchors.bottom: viewRect.bottom
        width: 10
        scrollColor: "#dbe1e5"
        opacity: 0
        orientation: Qt.Vertical
        position: chatView.visibleArea.yPosition
        pageSize: chatView.visibleArea.heightRatio
        clip: true
    }
    states: State {
        name: "ShowBars"
        when: chatView.movingVertically || chatView.movingHorizontally
        PropertyChanges { target: scBar; opacity: 1 }
    }

    Rectangle{
        id:btn
        anchors.bottom: parent.bottom
        anchors.right: viewRect.right
        anchors.rightMargin: 10
        anchors.bottomMargin: 2
        width: 80
        height: 20
        border.width: 1
        border.color: "gray"
        radius: 5
        Text{
            id:cli
            text: "发送"
            anchors.centerIn: parent
        }

        MouseArea{
            id:ma
            anchors.fill: parent
            enabled: edit.text.length?true:false
            onClicked: {
                appendData(edit.text,0);
                edit.text = "";
                chatView.positionViewAtEnd();
                animation3.stop();
                animation3.start();
                biaoq.visible = false;
            }
        }
    }

    Rectangle{
        id:btn1
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottomMargin: 2
        width: 80
        height: 20
        border.width: 1
        border.color: "gray"
        radius: 5
        Text{
            id:cli1
            text: "接收者"
            anchors.centerIn: parent
        }

        MouseArea{
            id:ma1
            anchors.fill: parent
            enabled: edit.text.length?true:false
            onClicked: {
                appendData(edit.text,1);
                edit.text = "";
                chatView.positionViewAtEnd();
                animation3.stop();
                animation3.start();
                biaoq.visible = false;
            }
        }
    }
    function findAtSome(str,iflag)
    {
        for(var i=0;i<chatModel.count;i++)
        {
            var tmp = "@";
            tmp += chatModel.get(i).chatName1;
            console.log("tmp "+tmp +" str" +str);
            if(str.indexOf(tmp) >= 0 && iflag !== chatModel.get(i).chatName1)
            {
                console.log("in it.................")
                return true;
            }else{
                continue;
            }
        }
        return false;
    }

    function appendData(str,iflag)
    {
       var tmp = str;//.replace(/[\r\n]/g,"");
//       var curTime = new Date().UTC();
        var curTime=new Date().getTime();
//        结果：1280977330748
       console.log(curTime);
       var isRepeat = findSameTime(curTime.toString());
        var tmpTime;
        if(isRepeat)
        {
            tmpTime = "";
        }else{
            tmpTime = curTime.toString();
        }
        var curName;
       if(iflag == 0)
       {
           curName = "卧栏听雨";
           chatModel.append({"chatName1": "卧栏听雨", "chatHead1":"http://img01.nduoa.com/apk/658/658954/icon_72.png", "chatContents1":tmp, "chatFlag1":0,"chatTime1":tmpTime});
       }else{
           curName = "寒山居士";
           chatModel.append({"chatName1": "寒山居士", "chatHead1":"http://img01.nduoa.com/apk/662/662455/icon_72.png", "chatContents1":tmp, "chatFlag1":1,"chatTime1":tmpTime});


       }
       if(findAtSome(str,curName))
       {
           animation.stop();
           atName.text = str;
           animation.start();
       }
   }
    function findSameTime(str)
    {
        for(var i=0;i<chatModel.count;i++)
        {
            if(isSameTime(chatModel.get(i).chatTime1,str))
            {
                console.log("model time: "+chatModel.get(i).chatTime1)
                return true;
            }else{
                continue;
            }
        }
        return false;
    }

    function getFormatData(msecond,iType)
    {
        var dates = new Date((msecond - 0)+ 8*3600);;
        if(iType == 0)
        {
            return dates.getUTCFullYear().toString();
        }else if(iType == 1)
        {
            return dates.getMonth().toString();
        }else if(iType == 2)
        {
            return dates.getDate().toString();
        }else if(iType == 3)
        {
            return dates.getHours().toString();
        }else if(iType == 4)
        {
            return dates.getMinutes().toString();
        }
    }

    function isSameTime(strModel,str)
    {
        var tmpTime = strModel;
        console.log(tmpTime+" "+str);

        if(getFormatData(tmpTime,0) == getFormatData(str,0))
        {

            if(getFormatData(tmpTime,1) == getFormatData(str,1))
            {
                if(getFormatData(tmpTime,2) == getFormatData(str,2))
                {
                    if(getFormatData(tmpTime,3) == getFormatData(str,3))
                    {
                        if(getFormatData(tmpTime,4) == getFormatData(str,4))
                        {
                            console.log("alsfalkflaslakls is True");
                            return true;
                        }else{
                            return false;
                        }

                    }
                }
            }

            return false;
        }else{
            return false;
        }
    }

    function filterImg(str){
        for(var i=0;i<tmpModel.count;i++)
        {
            var curTitle=tmpModel.get(i).title2;
            var curPath = "<img src="+tmpModel.get(i).path+"/>";
            var reg = new RegExp(curTitle, "ig");
            str = str.replace(reg, curPath);
        }
        var orgStr =str.replace(/<<(.+?)>>/gi,"&lt;&lt;$1&gt;&gt;");
        orgStr.replace(/'/gi,"&#39;")
        console.log("orgStrorgStrorgStr "+orgStr);
        return orgStr;
    }
}

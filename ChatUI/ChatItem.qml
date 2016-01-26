import QtQuick 2.0
import ".././YbTxt.js" as MyTxtJs
Rectangle {
    width: parent.width
    height:(getHeight()>48)?getHeight():52
    property string chatName: "Test"
    property string chatContents: "ajfkakf"
    property string chatHead: ""
    property string chatTime: "13819128918"
    property int chatFlag: 0 //0:myself 1: other
    property int chatIndex: 0

    function getHeight()
    {
        var iHeight = name.height+contents.height+20;
        console.log(iHeight);
        return iHeight;
    }
    function filterImg(str){
        for(var i=0;i<tmpModel.count;i++)
        {
            var curTitle=tmpModel.get(i).title2;
            var curPath = "<img src="+"\""+tmpModel.get(i).path+"\" "+ "width=\"24\" height=\"24\"\" />";
            var reg = new RegExp(curTitle, "ig");
            str = str.replace(reg, curPath);
        }
        var orgStr =str.replace(/<<(.+?)>>/gi,"&lt;&lt;$1&gt;&gt;");
        orgStr.replace(/'/gi,"&#39;")
        console.log("orgStrorgStrorgStr "+orgStr);
        return orgStr;
    }
    Image {
        id: chatImg
        source: chatHead
        anchors.top: parent.top
        anchors.topMargin: 4
        anchors.left: parent.left
        anchors.leftMargin: (chatFlag==0)?parent.width-50:10
        width: 36
        height: 36
    }

    Text {
        id: name
        text: chatName
        width: 100
        clip: true
        height: 20
        anchors.left: (chatFlag==0)?chatImg.left:chatImg.right
        anchors.leftMargin: (chatFlag==0)?-100:4
        anchors.top: parent.top
        anchors.topMargin: 4
        horizontalAlignment: (chatFlag==0)?Text.AlignRight:Text.AlignLeft

    }
    Text{
        id: timeName
        text: changeMSecondToFullTime(chatTime)
        width: 180
        clip: true
        height: 20
        visible: isSameTime(chatTime)?false:true
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.verticalCenter: parent.verticalCenter
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    Rectangle{

        width: (contents.paintedWidth>parent.width-70)?(parent.width-70):contents.paintedWidth
        height: contents.height+10
        anchors.left: (chatFlag==0)?parent.left:chatImg.right
        anchors.leftMargin: (chatFlag==0)?(parent.width-width-60):4
        anchors.top: name.bottom
        anchors.topMargin: 4
        border.width: 1
        border.color: (chatFlag == 0)?"#bcbfc4":"gray"
        radius: 5
        color: (chatFlag == 0)?"gray":"#e4e8ee"
        Text {
            id: contents
            text: filterImg(chatContents)
            color: (chatIndex%2 ==0)?"white":"black"
            width: parent.width

            font.family: MyTxtJs.textType
            font.pixelSize: MyTxtJs.textSize+2
            wrapMode: Text.WrapAnywhere
            lineHeight: 5+contents.font.pixelSize
            lineHeightMode: Text.FixedHeight
            font.wordSpacing: 1.0
            smooth: true
            renderType: Text.NativeRendering
            //textFormat: Text.RichText
//            anchors.horizontalCenter: parent.horizontalCenter
//            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenter: parent.verticalCenter
        }

        Component.onCompleted: {
            console.log("parent width: "+width+" "+contents.paintedWidth);
        }
    }

    //change msecond to "year-month-date hour:minute" by feifei
    function changeMSecondToFullTime(msecond)
    {
        var date = new Date((msecond - 0)+ 8*3600);
        var dateArray = [date.getMonth()+1,date.getDate(),date.getHours(),date.getMinutes()];
        for(var i=0;i<dateArray.length;i++){
            if(dateArray[i]<10){
                dateArray[i] = "0" + dateArray[i];
            }
        }
        var now = date.getUTCFullYear() + "-"
                + dateArray[0] +"-" + dateArray[1] + " "
                + dateArray[2] +":" + dateArray[3];
        return now
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

    function isSameTime(str)
    {
        var tmpTime = new Date().getTime();
        console.log(tmpTime+" "+str);
        if(str != "")
        {
            return false;

        }else{
            return true;
        }

//        if(getFormatData(tmpTime,0) == getFormatData(str,0))
//        {

//            if(getFormatData(tmpTime,1) == getFormatData(str,1))
//            {
//                if(getFormatData(tmpTime,2) == getFormatData(str,2))
//                {
//                    if(getFormatData(tmpTime,3) == getFormatData(str,3))
//                    {
//                        if(getFormatData(tmpTime,4) == getFormatData(str,4))
//                        {
//                            console.log("alsfalkflaslakls is True");
//                            return true;
//                        }else{
//                            return false;
//                        }

//                    }
//                }
//            }

//            return false;
//        }else{
//            return false;
//        }
    }
}

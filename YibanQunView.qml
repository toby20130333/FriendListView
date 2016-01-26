import QtQuick 2.0
import "./ybjs.js" as MyJs

Rectangle {
    width: 360
    height: 600

    ListModel{
        id:qunModel
    }

    ListView{
        id:www
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 0
        height: parent.height-10
        cacheBuffer:1024*2
        model: qunModel
        clip: true
        delegate:YibanQun{
            id:xx
            width: www.width
            ybfModel:qun_info
            headName: qunname
        }
        Behavior on height {
             NumberAnimation { duration: 500 }
        }
    }
    Component.onCompleted: {
        console.log(MyJs.yibanQunJson);
        parseJson(MyJs.yibanQunJson)
    }
    function parseJson(str)
    {
        if(str != ""){
        qunModel.clear();
        var jsonObject = eval('(' + str + ')');
        var resultDataObj =  jsonObject.data.newsList;
        var response = jsonObject.response;
        //console.log("refresh data : "+response+" "+jsonObject.message)
        for(var i =0;i<resultDataObj.length;i++)
        {
            if(typeof resultDataObj[i] == "object")
            console.log("refresh: "+resultDataObj[i].qun_id)
            qunModel.append(resultDataObj[i]);
        }
    }
    }

}

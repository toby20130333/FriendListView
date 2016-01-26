import QtQuick 2.0

Rectangle {
    id:mainPage
    width: isDetailsUI?348:406; height: isDetailsUI?198:211
    property bool isDetailsUI: true
    signal signalClickCurrentImg(string imgName,string strPath);
    opacity: 0.8
    Component{
        id:imgc
        Rectangle {
                    id:item
                    width: grid.cellWidth; height: grid.cellHeight
                    border.width: 1
                    border.color: "#EAEAEA"
                    radius: 5
                    smooth: true
                    color: "#FFFFFF"
                    AnimatedImage { source: path; anchors.centerIn: parent;smooth: true }
                    MouseArea{
                        id:ma
                        anchors.fill: parent
                        hoverEnabled: true
                        onExited: {
                            item.opacity = 1.0;
                            item.color = "#FFFFFF"
                            mainHideCallBoard();
                        }
                        onEntered: {
                            item.opacity = 0.5;
                            item.color = "#EAEAEA"
                            var obj = mapToItem(null,x,y);
                            var posx = obj.x ;
                            var posy = obj.y ;
                           mainShowCallBoard(title,posx,posy);
                        }
                        onClicked: {
                            console.log(path+"\n"+title);
                            signalClickCurrentImg(title,path);
                        }
                    }
                }
    }
    GridView {
        id:grid
        width: 30*12; height: 30*6
        cellWidth:30; cellHeight:30
//        anchors.centerIn: parent
        anchors.left: parent.left
        anchors.leftMargin: isDetailsUI?5:20
        anchors.right: parent.right
        anchors.rightMargin: isDetailsUI?5:10
        anchors.top: parent.top
        anchors.topMargin: isDetailsUI?5:20
        model: ChatImageGif {}
        delegate: imgc
        focus: true
        boundsBehavior:Flickable.StopAtBounds
    }
    ChatITipsImg{
        id:imgBoard
        visible: false
        z:20
    }
    function mainShowCallBoard(number,posx,posy)
    {
        //console.log(number+"\n"+posx+"\n"+posy)
         var objxy = mapFromItem(null,posx,posy);
        var nx = objxy.x;
        var ny = objxy.y;
        if(nx<0)
        {
            nx = 0;
        }
        if(nx + imgBoard.width> mainPage.width)
        {
            nx = mainPage.width - imgBoard.width;
        }
        imgBoard.x = nx+6;
        imgBoard.y = ny+30;
        imgBoard.setCurrentTxt(number);
        imgBoard.visible = true;
    }
    function mainHideCallBoard()
    {
        imgBoard.visible = false;
    }
    Component.onCompleted: {
        //console.log("af;a;onCompletedonCompletedonCompletedonCompleted")
    }
}


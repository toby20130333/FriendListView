import QtQuick 2.1

Item {
    width: 360
    height: 50
    property string friendImg: "qrc:/images/4.png"
    property string friendName: "D团队"
    property string fspaceStatus: "qrc:/images/callme.png"
    property string fsignContent: "一叶知秋，一绿春来，一热夏至，一冷冬眠"
    property string frdLimit: ""
    property bool online: true
    Image {
        id: frdHead
        source: friendImg
        smooth: true
        width: 40
        height: 40
        anchors.verticalCenter: parent.verticalCenter
        ShaderEffect {
            width: 48; height: 48
            property variant src: frdHead
            visible: online?false:true
            vertexShader: "
                            uniform highp mat4 qt_Matrix;
                            attribute highp vec4 qt_Vertex;
                            attribute highp vec2 qt_MultiTexCoord0;
                            varying highp vec2 coord;
                            void main() {
                                coord = qt_MultiTexCoord0;
                                gl_Position = qt_Matrix * qt_Vertex;
                            }"
            fragmentShader: "
                            varying highp vec2 coord;
                            uniform sampler2D src;
                            uniform lowp float qt_Opacity;
                            void main() {
                                lowp vec4 tex = texture2D(src, coord);
                                gl_FragColor = vec4(vec3(dot(tex.rgb, vec3(0.344, 0.5, 0.156))), tex.a) * qt_Opacity;
                            }"
        }
    }
    Text {
        id: frdName
        text: friendName
        height: 20
        anchors.left: frdHead.right
        anchors.leftMargin: 10
        anchors.right: parent.right
        anchors.rightMargin: 10
        verticalAlignment: Text.AlignVCenter
        font.family: "微软雅黑"
        font.pixelSize: 18
    }
    Image {
        id: limiteImg
        anchors.left: frdHead.right
        anchors.leftMargin: 10
        anchors.top:frdName.bottom
        anchors.topMargin: 8
        source: (frdLimit!=0)?"qrc:/images/callme.png":"qrc:/images/vip.png"
        width: 15
        height: 15
//        anchors.verticalCenter: parent.verticalCenter
    }
    Text {
        id: signContent
        anchors.left: limiteImg.right
        anchors.leftMargin: 10
        anchors.top:frdName.bottom
        anchors.topMargin: 8
        text: fsignContent
        height: 20
        verticalAlignment: Text.AlignVCenter
        font.family: "微软雅黑"
        color: "gray"
    }
    MouseArea{
        id:ma
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            //frdHead.scale = 1.2;
//            color = "#C6D031"
        }
        onExited: {
//            color = "white"
            //frdHead.scale = 1.0;
        }
    }
    function setCurInfo(str)
    {
        var arr = str;
        online = str[0];
        friendImg = str[1];
        friendName = str[2];
        frdLimit = str[3];
        fsignContent = str[4];

    }
}

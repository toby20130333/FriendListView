import QtQuick 2.1

Rectangle {
    id:mainQun
    width: 360
    height: 40
    property string qunImg: "qrc:/images/4.png"
    property string qunName: "D团队"
    property string qununReadImg: "qrc:/images/callme.png"
    property bool ispingbi: false
    Row{
        id:ybRow
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        spacing: 8
        Image {
            id: frdHead
            source: qunImg
            smooth: true
            width: 30
            height: 30
            anchors.verticalCenter: parent.verticalCenter
            ShaderEffect {
                        width: 30; height: 30
                        property variant src: frdHead
                        visible: !ispingbi?false:true
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
            text: qunName
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            font.family: "微软雅黑"
        }
        Image {
            id: limiteImg
            source: (qununReadImg==0)?"qrc:/images/callme.png":"qrc:/images/vip.png"
            width: sourceSize.width
            height: sourceSize.height
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    MouseArea{
        id:ma
        anchors.fill: parent
        hoverEnabled: true
        onEntered: {
            frdHead.scale = 1.2;
            mainQun.scale = 1.2;
            color = "#C6D031"
        }
        onExited: {
            color = "white"
            frdHead.scale = 1.0;
            mainQun.scale = 1.0;
        }
    }
}

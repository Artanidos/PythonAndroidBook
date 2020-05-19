import QtQuick 2.0
import QtQuick.Controls 2.5

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: "QML Demo"

    function updateMessage(text)
    {
        txt.text = text
    }

    Text {
        id: txt
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: "cwd: " + bridge.cwd
    }
    MouseArea {
        anchors.fill: parent
        onClicked: 
        {
            bridge.message("click")
        }
    }
}

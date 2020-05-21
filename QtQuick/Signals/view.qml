import QtQuick 2.12
import QtQuick.Controls 2.5

ApplicationWindow 
{
    id: root
    width: 640
    height: 480
    visible: true
    title: "QML Signal Demo"

    Component.onCompleted: 
    {
        console.log("The windows title is", title)
    }
    
    Button 
    {
        id: button
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Change color!"
        
        onClicked: 
        {
            root.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        }
    }

    Rectangle 
    {
        id: rect
        width: 100; height: 100
        color: "#C0C0C0"

        TapHandler 
        {
            onPressedChanged: console.log("pressed changed to ", pressed)
        }
    }

    SqareButton
    {
        color: "#345462"
        x: 200
        y: 0
        onActivated: console.log("Activated at " + xPosition + "," + yPosition)
    }

    Connections 
    {
        target: button
        onClicked: 
        {
            rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        }
    }
}
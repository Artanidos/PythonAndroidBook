import QtQuick 2.5
import QtQuick.Controls 2.5

ApplicationWindow 
{
    id: applicationWindow
    width: 350
    height: 600
    visible: true
    title: "Anchors Demo"

    property int clickCount: 0

    Rectangle 
    {
        width: 100
        height: 100
        color: "#75507b"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        
        Text 
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Center"
        }
    }

    Rectangle 
    {
        width: 100
        height: 100
        color: "#73d216"
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20

        Text 
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Left - Top"
        }
    }

    Rectangle 
    {
        width: 100
        height: 100
        color: "#73d216"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20

        Text 
        {
            id: txt
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Right - Bottom "
        }

        MouseArea 
        {
            anchors.fill: parent
            onClicked:  
            {
                increment()
                txt.text = "clicked " + clickCount + " times"
            }

            function increment() 
            {
                clickCount++
            }
        }
    }

    Rectangle 
    {
        width: 100
        height: 100
        color: "#73d216"
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20

        Text 
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Right - Top"
        }
    }

    Rectangle 
    {
        width: 100
        height: 100
        color: "#73d216"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20

        Text 
        {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            text: "Left - Bottom"
        }
    }
}

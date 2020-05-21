import QtQuick 2.12

Rectangle 
{
    id: root
    signal activated(real xPosition, real yPosition)
    property point mouseXY
    property int side: 100
    width: side; height: side

    TapHandler 
    {
        id: handler
        onTapped: root.activated(mouseXY.x, mouseXY.y)
        onPressedChanged: mouseXY = handler.point.position
    }
}
# Part III - QML

## QML Syntax
The QML syntax has been invented to declare user interfaces with an easy to read and easy to write new syntax, based on the ideas of XAML, Json and Javascript.  
It combines the best of all of these languages.

In QML the userinterface is declared as a hirachy tree. Each item is positioned inside another item. The events triggert by a control, when teh user clicks a button for example, can be coded in a javascript like language.  

To declare the item tree we use the item name followed by an open bracket and a close bracket.
```qml
Rectangle { }
```

To set the value of a property you write the name of the property followed by a colon ":" and then the value.  
```qml
name: value
```
To declare numeric value you just put the numeric digit behind the colon.  
```qml
width: 200
```
If you have got a text, then the value if put between quotations marks. **"** or **'**.
```qml
text: "The quick brown fox"
```
If you are using colors you put them also between quotation marks, leaded by a hash.  
```qml
color: "#FF00FF"
```
Here the red part of the color is set to hex FF (255). Green is set to 0 and blue is set to FF (255).  

You can also set the opacity using an additional hex value.
```qml
color: "#FF00FFEE"
```
Here the opacity has been set to EE (238).  
 
It is also possible to bind values of items to values of other items using javascript.
```qml
text: "The parent is " + parent.width + " pixels wide"
```
Lets assume the parent is the application window which I have set to a width of 350 pixels, then the text will say: The parent is 350 pixels wide  
If I would resize the window then this value is updated with every mousemove event to show the new width.

### Id
A special value in QML is called id.  
```qml
ApplicationWindow 
{
    id: root
    Text 
    {
        text: "The parent is " + root.width + " pixels wide"
    }
}
```
The **id** is a readonly value which can only be declared once. It is used to reference items. A good practice is to name the root item with the id: root, so that it's similar to all QML objects.   

Child elements inherits the coordinate sytem from the parent. So the x and y coordinates are always relative to the parent.

Every QML needs to have exactly one root element. So there can only be one ApplicationWindow for example.  

### Child Objects
Any object declaration can define child objects through nested object declarations. In this way, any object declaration implicitly declares an object tree that may contain any number of child objects.

```qml
Rectangle 
{
    color: "red"

    MouseArea
    {
        anchors.fill: parent
    }
}
```

### Comments
Comments can be made using // for a single line or /* */ for multiple lines, just like in C, C++ and Javascript.  

Elements can be nested. So a parent element can have multiple child elements.  

### Import Statements
    import Namespace VersionMajor.VersionMinor
    import Namespace VersionMajor.VersionMinor as SingletonIdentifier
    import "directory"
    import "file.js" as ScriptIdentifier

With the import statement you import a specific version of a QML module.
```qml
import QtQuick 2.5
```
The major version points to the QtQuick version you intent to use. And the minor version stands for the Qt version. So the above sample is importing QtQuick 2 and a Qt version 5.*.  
So the version 2.12 to import points to QtQuick 2 and Qt 5.12.  

## Properties
You can declare properties using the property qualifier followed by the type, the name and an optional initial value. The syntax is ```property <type> <name> : <value>```  
```qml
property int clickCount: 0
```

Another possibilty is to use the alias keyword to forward a property of an object or the object itself to the outer scope. The syntax is ```property alias <name>: <reference>```
```qml
property alias text: lable.text
``` 
A property alias does not need a type. It used the type of the referenced property.   

## Property Binding
One of the most importand features of QML is the property binding. A value of a property can be set via a constant, an expression or via binding to another property.  

```qml
Rectangle 
{
    width: 200; height: 200

    Rectangle 
    {
        width: 100
        height: parent.height
        color: "red"
    }
}
```
In the above case the height has been bound to the height of the parent object. If we change the height of the parent, then the height of the inner rect will be adjusted automatically.  

## Signals
### Receiving signals and signal handlers
To receive a notification when a signal is emitted for an object, the object definition should declare a signal handler named on<Signal>, where Signal is the name of the signal, with the first letter capitalized. The signal handler should contain the JavaScript code to be executed when the signal handler is invoked.  
```qml
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
```
In the above case the Button has got a signal with the name clicked and we create a signal handler with the corresponding name onClicked.  

### Property change signal handlers
A signal is emitted when the value of a QML property changes. This type of signal is a property change signal and signal handlers for these signals are written in the form on<PropertyName>Changed, where PropertyName is the name of the property, with the first letter capitalized.   
```qml
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
```
For example, the TapHandler of a Rectangle has got a pressed property. To receive a notification whenever this property changes, write a signal handler named onPressedChanged like in the above sample.  

### Connections
In some cases we want to access a signal outside of an object. Therefore we use the Connections type.  
```qml
    Connections 
    {
        target: button
        onClicked: 
        {
            rect.color = Qt.rgba(Math.random(), Math.random(), Math.random(), 1);
        }
    }
```

### Attached signal handlers
An attached signal handler receives a signal from an attached type.  
```qml
    Component.onCompleted: 
    {
        console.log("The windows title is", title)
    }
```
In the above case the onCompleted event is fired, when the ApplicationWindow has been loaded.  
 
### Signals for a custom QML type  
The syntax for defining a new signal is:  
signal <name>[([<type> <parameter name>[, ...]])]  
A signal is emitted by invoking the signal as a method.  
```qml
// SquareButton.qml
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
```
The Rectangle object has an activated signal, which is emitted whenever the TapHandler is tapped.  

To use this signal you declare an onActivated handler in the code that uses the SqareButton.  
```qml
    SqareButton
    {
        color: "#345462"
        x: 200
        y: 0
        onActivated: console.log("Activated at " + xPosition + "," + yPosition)
    }
```
##Functions
To declare a JavaScript function you are using the folowing syntax 
```
function <name> ( <parameters> ) { ... }
```
In the next sample we have got the Text with the id txt.
In the same parent we have go a MouseArea which is used just a get a click event when the user click in it with the mouse or when the user touches this area on a mobile.
```qml
anchor.fill: parent
```   
This gives the MouseArea the same size and position as the parent.   

```qml
property int clickCount: 0

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
```
The MouseArea has got a Clicked event, which we are coding with the "on" prefix.  
If you have more than one line of code you have to use brackets.  
In this event we are calling the function increment.  
The property clickCount we declare on top level. It's a god habit to declare all variables in the top of the root element. 
##Interaction between QML and Python
You may code almost everything in QML (Javascript), but sometimes you need to do business logic in Python. Therefore I will show you a possible bridge.  
We are creating a class derived from QObject and give an instance of this class to QML via context property.  

```python
import sys
import os
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QObject, pyqtProperty, pyqtSignal, pyqtSlot


class Bridge(QObject):
    textChanged = pyqtSignal()

    def __init__(self, parent=None):
        QObject.__init__(self, parent)
        self._root = None
        self._cwd = os.getcwd()

    def setRoot(self, root):
        self._root = root

    @pyqtProperty(str, notify=textChanged)
    def cwd(self):
        return self._cwd

    @pyqtSlot("QString")
    def message(self, value):
        print(value + " from QML")
        self._root.updateMessage(value + " from Python")


if __name__ == "__main__":
    bridge = Bridge()
    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("bridge", bridge)
    engine.load("view.qml")
    roots = engine.rootObjects()
    bridge.setRoot(roots[0])
    if not roots:
        sys.exit(-1)
    sys.exit(app.exec())
```

In QML you can use the object bridge to communicate with Python.  
```qml
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

```
```bridge.cwd
``` is using the property declared in Python to get the current working directory.  
And with ```bridge.message
``` we are sending data to a Python slot.  
On the Python side we are able to call a Javascript function using the root object.  
```python
self._root.updateMessage(value + " from Python")
```

## Screen size 
To place items on the surface we have to position them.  
When you are comming from a windows environment like WinForms, then you know how to position item using their x and y coordinates.  
This was fine for windows, where the screensize was kind of known back in the years.  
We only had screen sizes like 640 x 480 or 1024 x 768. Where you tried to support the smallest screen resolution when designing a dialog.  
On a mobil phone we have hundreds of different screen resolutions and form factors, so we have to change our thinking how to design a dialog.  
Also we do not create dialogs anymore.  
Normally we create full screen pages.  

When you are developing on a desktop computer you have to simulate the form factor of a mobile phone.  
Because of the fact that my mobile phone has a resolution of 700 * 1200 and my desktop has 1366 * 768, I have to find a screen size to simulate the portrait mode of my phone on my desktop. So I am setting the ApplicationWindow to the size 350 * 600, so that the window fits on my screen and mimics the portrait mode of a mobile phone.

```qml
ApplicationWindow #
{
    id: applicationWindow
    width: 350
    height: 600
    visible: true
    title: "Anchors Demo"
```
You should find another but similar solution for your environment.  

So when we would use the direct positioning like we did on windows, where we used the x and y coordinates to position an item, we should use a different solution for the phone, because we don't know the screen resolution of the target platform.  
  
## Positioning Items
To position an item in QML we are using anchors.  
You can still use the x and y coordinates, but it only makes sense, if the item is anchored to the upper left.
You can anchor an item to the top, bottom, left and to the right. Additionally you can also anchor an item to the horizontalCenter and to the verticalCenter.  

```qml
    Rectangle 
    {
        id: rectangle
        width: 100
        height: 100
        color: "#75507b"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
    }
```
In the above sample the center of the rectangle is bound to the center of the parent item, which is the application window or it could be another item.  

If you want to anchor an item to the lower right then you positioning it as follows.  
```qml
    Rectangle
    {
        width: 100
        height: 100
        color: "#73d216"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20
    }
```
The margin is the distance between the item am the parents site.  

In the source code to this book you will find a sample with all anchors under *QtQuick/Anchors*.  

## Controls
The most used control on a mobile phone might be the listbox.  
Here is a sample which shows how to use it with a static model.   
```qml
import QtQuick 2.0
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.1

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: "QML Listview Demo"

    ListView 
	{
	 	clip: true
		anchors.fill: parent
		anchors.margins: 5
	 	spacing: 5
	    	
		delegate: listDelegate
	    	
	    Component 
		{
	 	   	id: listDelegate
	    		
	    	RowLayout 
			{
				anchors.left: parent.left
				anchors.right: parent.right
        		anchors.margins: 10
        		spacing: 10

        		CheckBox {}
        		Label { text: itemType; color: "#888"; font.italic: true }
        		Label { text: itemName; Layout.fillWidth: true }
        		Label { text: itemPath }
        		ComboBox { model: itemVersions; Layout.preferredWidth: 90 }
    		}
		} 
	    	
	    model: ListModel 
		{
    	    ListElement 
			{
				itemType: "asset"
                itemName: "First entry"
                itemPath: "/documents/fe.md"
				itemVersions: []
         	}
     	    ListElement 
			{
				itemType: "asset"
                itemName: "Second entry"
                itemPath: "/documents/se.md"
				itemVersions: []
         	}
			ListElement 
			{
				itemType: "asset"
                itemName: "Third entry"
                itemPath: "/documents/te.md"
				itemVersions: []
         	}
        }
    }
}
```
To render the list we design a component which is used as a delegate.  
The model which delivers the data we use declarative here in this sample, to make it easier to understand.  

So next we will use a model build in Python.
```python
import sys
from PyQt5.QtGui import QGuiApplication
from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import Qt, QObject, pyqtProperty, pyqtSignal, pyqtSlot, QAbstractListModel, QModelIndex


class Model(QAbstractListModel):
    def __init__(self, items, parent=None):
        super(Model, self).__init__(parent)
        self._items = items

    def rowCount(self, parent=None):
        return len(self._items)

    def data(self, index, role=None):
        role = role or QModelIndex()

        if role == Qt.UserRole + 0:
            return self._items[index.row()]["type"]

        if role == Qt.UserRole + 1:
            return self._items[index.row()]["name"]

        if role == Qt.UserRole + 2:
            return self._items[index.row()]["path"]

        if role == Qt.UserRole + 3:
            return self._items[index.row()]["versions"]

    def roleNames(self):
        return {
            Qt.UserRole + 0: b"itemType",
            Qt.UserRole + 1: b"itemName",
            Qt.UserRole + 2: b"itemPath",
            Qt.UserRole + 3: b"itemVersions",
        }


if __name__ == "__main__":
    items = [
        {
            "type": "asset",
            "name": "shapes",
            "path": "c:/users/Roy/Desktop/shapes.ma",
            "versions": ["v001", "v002", "v003"]
        },
        {
            "type": "asset",
            "name": "shapes1",
            "path": "c:/users/Roy/Desktop/shapes.ma",
            "versions": ["v001", "v002", "v003", "v004"]
        },
        {
            "type": "asset",
            "name": "shapes2",
            "path": "c:/users/Roy/Desktop/shapes.ma",
            "versions": ["v001", "v002", "v003"]
        },
    ]
    model = Model(items)

    app = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.rootContext().setContextProperty("mymodel", model)
    engine.load("view.qml")
    roots = engine.rootObjects()
    if not roots:
        sys.exit(-1)
    sys.exit(app.exec())
```
In the view we just have to change the model.  
```qml
model: mymodel
```
The model object has now been set as a context property.  

## Summary
We have seen the basics of QML. We are now able to create simple apps using QML and Python.  
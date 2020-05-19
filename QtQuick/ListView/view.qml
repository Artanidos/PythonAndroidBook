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
        		Label { text: itemAge; color: "#888"; font.italic: true }
        		Label { text: itemName; Layout.fillWidth: true }
        		Label { text: itemTown }
    		}
		} 
	    	
		model: mymodel
		/*
	    model: ListModel 
		{
    	    ListElement 
			{
				itemType: 43
                itemName: "Hans Meiser"
                itemTown: "56543 Berlin"
         	}
     	    ListElement 
			{
				itemType: 67
                itemName: "Boris Müller"
                itemTown: "24567 Hamburg"
         	}
			ListElement 
			{
				itemType: 34
                itemName: "Jens Schmidt"
                itemTown: "55651 Berlin"
         	}
        }
		*/
    }
}
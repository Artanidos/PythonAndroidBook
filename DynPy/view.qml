// all imports we need later on the phone should be listed here
// even if this view doesn't need it
// it is used by pyqtdeploy, which scans this file for libs to include in the APK
import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.0
import QtMultimedia 5.4

ApplicationWindow {
    visible: true

    Text {
        anchors.centerIn: parent
        text: "DynPy"
    }
}
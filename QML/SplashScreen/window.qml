
import QtQml 2.2
import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

ApplicationWindow {
	id: mainWindow
    flags: Qt.Window | Qt.WindowTitleHint | Qt.WindowSystemMenuHint | Qt.WindowCloseButtonHint
	width: 300
    height: 400
	visible: false
	title: "Scresh Screen Test"

    Component.onCompleted: {
        var timeout = new Date().valueOf() + 3000;
        while(timeout > new Date().valueOf()) {}
    }

    Text {
        text: "Window ready!"
        anchors.centerIn: parent
        font.bold: true
        font.pixelSize: 20
        color: "black"
    }
}
	

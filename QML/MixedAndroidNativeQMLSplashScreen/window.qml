
import QtQml 2.2
import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.0

Item {
	id: mainWindow
	visible: false

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
	

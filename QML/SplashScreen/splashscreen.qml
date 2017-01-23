
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2

Window {
    id: splashScreen
    modality: Qt.ApplicationModal
    flags: Qt.SplashScreen
	width: 300
	height: 300

	Rectangle {
		id: splashRect
		anchors.fill: parent
	    color: "white"
		border.width: 1
		border.color: "black"
		
		Text {
			id: initializationErrorMessage
			text: "This is the splash screen"
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.top: parent.top
            anchors.topMargin: 50
			font.bold: true
			font.pixelSize: 20
			color: "black"
		}

		BusyIndicator {
			id: busyAnimation
			anchors.horizontalCenter: parent.horizontalCenter
			anchors.bottom: parent.bottom
			anchors.bottomMargin: parent.height / 5
			width: parent.width / 2
			height: width
			running: true
		}
	}

    Component.onCompleted: visible = true
}

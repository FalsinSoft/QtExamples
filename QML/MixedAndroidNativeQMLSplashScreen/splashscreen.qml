
import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Window 2.2

Rectangle {
    id: splashRect
    color: "#81DAF5"

    Image {
        anchors.centerIn: parent
        source: "image://Android/icon"
        width: sourceSize.width / Screen.devicePixelRatio
        height: sourceSize.height / Screen.devicePixelRatio
    }

    BusyIndicator {
        id: busyAnimation
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height / 7
        width: parent.width / 3
        height: width
        running: true
    }
}

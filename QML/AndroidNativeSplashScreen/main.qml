import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: "Android Native Splash Screen"

    Label {
        text: "This is the main app"
        font.pixelSize: 20
        anchors.centerIn: parent
    }
}

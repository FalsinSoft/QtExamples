import QtQuick 2.3
import QtQuick.Window 2.3
import QtQuick.Controls 2.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Android Screen Orientation Example")
    color: "darkCyan"

    readonly property int android_SCREEN_ORIENTATION_LANDSCAPE: 0
    readonly property int android_SCREEN_ORIENTATION_PORTRAIT: 1

    Column {
        width: 300
        anchors.centerIn: parent
        spacing: 30

        Button {
            width: parent.width
            text: "SCREEN_ORIENTATION_LANDSCAPE"
            onClicked: android.setScreenOrientation(android_SCREEN_ORIENTATION_LANDSCAPE)
        }
        Button {
            width: parent.width
            text: "SCREEN_ORIENTATION_PORTRAIT"
            onClicked: android.setScreenOrientation(android_SCREEN_ORIENTATION_PORTRAIT)
        }
    }
}

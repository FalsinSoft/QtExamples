import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Android Keyboard Size")

    function androidVirtualKeyboardStateChanged(virtualKeyboardHeight)
    {
        if(virtualKeyboardHeight > 0)
            appBody.height = (appBody.parent.height - (virtualKeyboardHeight / Screen.devicePixelRatio));
        else
            appBody.height = appBody.parent.height;
    }

    header: ToolBar {
        Material.foreground: "white"

        Label {
            anchors.fill: parent
            text: "Top Bar"
            font.pixelSize: 20
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
        }
    }

    ColumnLayout {
        id: appBody
        width: parent.width
        height: parent.height

        TextArea {
            id: mainText
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true
            placeholderText: "Touch here for show virtual keyboard"
        }

        Rectangle {
            Layout.preferredWidth: parent.width
            Layout.preferredHeight: 40
            color: "darkCyan"

            Label {
                anchors.fill: parent
                text: "Bottom side after text control"
                color: "white"
                font.pixelSize: 20
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
            }
        }
    }
}

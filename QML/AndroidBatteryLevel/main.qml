import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Android Battery Level")
    color: "blue"

    function androidBatteryStateChanged(level, onCharge)
    {
        batteryLevel.text = "Battery level: " + level + "%";
        batteryStatus.text = "On charging: " + (onCharge ? "Yes" : "No");
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Label {
            id: batteryLevel
            font.pixelSize: 20
            color: "white"
        }
        Label {
            id: batteryStatus
            font.pixelSize: 20
            color: "white"
        }
    }
}

import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Window 2.2
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Android Signal Strength")
    color: "darkCyan"

    function androidSignalStrengthChanged(signalStrength)
    {
        var signalStatus;

        if(signalStrength >= 30)
            signalStatus = "Great";
        else if(signalStrength >= 20)
            signalStatus = "Good";
        else if(signalStrength >= 12)
            signalStatus = "Moderate";
        else if(signalStrength >= 5)
            signalStatus = "Poor";
        else
            signalStatus = "None";

        signalLevel.text = "Signal Strength: " + signalStatus;
    }

    Label {
        id: signalLevel
        font.pixelSize: 20
        color: "white"
        anchors.centerIn: parent
    }
}

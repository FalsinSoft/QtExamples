import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

Window {
    visible: true
    width: 640
    height: 480
    color: "#E0F8F7"

    Component.onCompleted: {
        var info = android.getApkInfo();
        packageName.text = info.packageName;
        versionName.text = info.versionName;
        versionCode.text = info.versionCode;
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Label { text: "Package Name:" }
        Label { color: "red"; id: packageName }
        Label { text: "Version Name:" }
        Label { color: "red"; id: versionName }
        Label { text: "Version Code:" }
        Label { color: "red"; id: versionCode }
    }
}

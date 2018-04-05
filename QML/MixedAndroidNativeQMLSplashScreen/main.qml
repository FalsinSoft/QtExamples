import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 600
    height: 800

    Loader {
        id: mainWindowLoader
        anchors.fill: parent
        active: false
        source: "qrc:/window.qml"
        asynchronous: true
        onLoaded: {
            item.visible = true;
            splashScreenLoader.item.visible = false;
            splashScreenLoader.source = "";
        }
    }

    Loader {
        id: splashScreenLoader
        source: "qrc:/splashscreen.qml"
        anchors.fill: parent
        onLoaded: {
            mainWindowLoader.active = true;
            android.hideSplashScreen();
        }
    }
}

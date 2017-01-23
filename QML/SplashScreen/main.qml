import QtQml 2.2
import QtQuick 2.6

Item {
    Loader {
        id: mainWindowLoader
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
        onLoaded: {
            mainWindowLoader.active = true;
        }
    }
}

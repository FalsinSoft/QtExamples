import QtQuick 2.12
import QtQuick.Window 2.12
import QtGraphicalEffects 1.12

Window {
    visible: true
    width: 480
    height: 480
    title: qsTr("Emboss")
    color: "lightsteelblue"

    Grid {
        anchors.centerIn: parent
        columns: 2
        spacing: 10

        Rectangle {
            width: 200
            height: 200
            radius: 10
            gradient: "LandingAircraft"

            Emboss {
                anchors.fill: parent
                source: parent
                offset: 2
                radius: 3
            }
        }
        Rectangle {
            width: 200
            height: 200
            radius: 10
            gradient: "LandingAircraft"

            Emboss {
                anchors.fill: parent
                source: parent
                offset: -2
                radius: 3
            }
        }
        Rectangle {
            width: 200
            height: 200
            radius: 10
            gradient: "AboveTheSky"

            Emboss {
                anchors.fill: parent
                source: parent
                opacity: 0.6
                offset: 2
                radius: 6
            }
        }
        Rectangle {
            width: 200
            height: 200
            radius: 10
            gradient: "AboveTheSky"

            Emboss {
                anchors.fill: parent
                source: parent
                opacity: 0.6
                offset: -2
                radius: 6
            }
        }
    }
}

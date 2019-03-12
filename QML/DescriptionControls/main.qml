import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

Window {
    visible: true
    width: 400
    height: 300

    Column {
        anchors.centerIn: parent
        width: parent.width * 0.9
        spacing: 20

        DescriptionRadioButton {
            text: "This is the radio button"
            description: "This is the very very very very very very very very very very very very long description"
        }
        DescriptionCheckBox {
            text: "This is the check box"
            description: "This is the very very very very very very very very very very very very long description"
        }
    }
}

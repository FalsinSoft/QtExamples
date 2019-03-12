
import QtQuick 2.7
import QtQuick.Controls 2.1

CheckBox {
    id: descriptionCheckBox
	width: parent.width
    indicator.y: topPadding + (textLabel.height / 2) - (descriptionCheckBox.indicator.height / 2)

    property string description

    contentItem: Column {
        readonly property int sideOffset: descriptionCheckBox.indicator.width + descriptionCheckBox.spacing
        spacing: 15

		Label {
			id: textLabel
            width: parent.width - leftPadding
            text: descriptionCheckBox.text
            font: descriptionCheckBox.font
            horizontalAlignment: Label.AlignLeft
            verticalAlignment: Label.AlignTop
			leftPadding: parent.sideOffset
			wrapMode: Label.Wrap
		}
		Label {
			id: descriptionLabel
            text: description
			color: "gray"
			visible: text.length > 0
            width: parent.width - leftPadding
            font: descriptionCheckBox.font
            horizontalAlignment: Label.AlignLeft
            verticalAlignment: Label.AlignTop
            leftPadding: parent.sideOffset
			wrapMode: Label.Wrap
		}
	}
}

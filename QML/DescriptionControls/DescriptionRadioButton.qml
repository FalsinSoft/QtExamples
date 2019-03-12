
import QtQuick 2.7
import QtQuick.Controls 2.1

RadioButton {
	id: descriptionRadioButton
	width: parent.width
    indicator.y: topPadding + (textLabel.height / 2) - (descriptionRadioButton.indicator.height / 2)

    property string description

    contentItem: Column {
        readonly property int sideOffset: descriptionRadioButton.indicator.width + descriptionRadioButton.spacing
        spacing: 15

		Label {
			id: textLabel
            width: parent.width - leftPadding
			text: descriptionRadioButton.text
			font: descriptionRadioButton.font
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
			font: descriptionRadioButton.font
            horizontalAlignment: Label.AlignLeft
            verticalAlignment: Label.AlignTop
            leftPadding: parent.sideOffset
			wrapMode: Label.Wrap
		}
	}
}

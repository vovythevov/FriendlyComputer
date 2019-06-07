import QtQuick 2.10
import QtQuick.Controls 2.5
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3

Item {
    id: setup

    signal finished()
    signal error()

    property int expectedValue: 0
    property string imageSource
    property string instructionText

    SpinBox {
        id: input
        anchors.right: confirm.left
        anchors.rightMargin: 20
        enabled: true
        editable: true
        anchors.verticalCenter: variableText.verticalCenter
        font.pointSize: 16
    }

    Text {
        id: variableText
        text: qsTr("Input the value here:")
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        font.pixelSize: 40
    }

    TextArea {
        id: instructions
        text: instructionText
        anchors.top: image.bottom
        anchors.topMargin: 20
        anchors.bottom: variableText.top
        anchors.bottomMargin: 20
        font.pointSize: 16
        wrapMode: Text.WordWrap
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    Image {
        id: image
        width: 240
        height: 240
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        source: imageSource
    }

    RoundButton {
        id: confirm
        x: 525
        y: 418
        width: 40
        text: qsTr("")
        anchors.verticalCenter: variableText.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20

        Image {
            id: confirmImage
            anchors.fill: parent
            source: "Icons/Confirm.svg"
        }

        onClicked: confirmDialog.open()
        }

    MessageDialog {
        id: confirmDialog
        title: "Are you sure ?"
        text: "Are you sure the value you entered is correct ? There are consequences to your actions."
        standardButtons: StandardButton.Ok | StandardButton.Cancel

        onAccepted: {
            if (input.value == expectedValue) {
                setup.finished()
            }
            else {
                setup.error()
            }
        }
    }
}

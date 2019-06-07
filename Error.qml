import QtQuick 2.10
import QtQuick.Controls 2.5
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3

Item {
    id: error

    signal finished()

    property string instructionText

    anchors.fill: parent

    Image {
        id: image
        width: 240
        height: 240
        source: "Icons/Skull.svg"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
    }

    TextArea {
        id: instructions
        text: "Error !! "
        anchors.top: image.bottom
        anchors.topMargin: 20
        anchors.bottom: image.top
        anchors.bottomMargin: 20
        font.pointSize: 16
        wrapMode: Text.WordWrap
        anchors.right: parent.right
        anchors.rightMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    RoundButton {
        id: confirm
        text: qsTr("")
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter

        Image {
            id: confirmImage
            anchors.fill: parent
            source: "Icons/Confirm.svg"
        }

        onClicked: error.finished()
    }
}

import QtQuick 2.10
import QtQuick.Controls 2.0
import QtQuick.Window 2.3

Item {
    id: setup

    signal finished()

    property int expectedValue: 0
    property string imageSource
    property string instructionText

    SpinBox {
        id: spinBox
        enabled: true
        editable: true
        anchors.verticalCenter: variableText.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 20
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
        anchors.topMargin: 0
        source: imageSource
    }



}

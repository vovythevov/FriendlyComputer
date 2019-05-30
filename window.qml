import QtQuick 2.10
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    width: 640
    height: 480
    minimumWidth: 640
    minimumHeight: 480
    title: "Operating system"
    visible: true

    Image {
        id: gear
        width: window.width * 0.2
        height: window.height * 0.2
        anchors.bottom: parent.verticalCenter
        anchors.bottomMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter

        fillMode: Image.PreserveAspectFit
        source: "Icons/Gear.svg"

        RotationAnimator {
            loops: Animation.Infinite
            running: true
            target: gear
            from: 0
            to: 360
            duration: 10000
        }
    }

    Text {
        id: text1
        x: 356
        text: qsTr("Text To Fill")
        horizontalAlignment: Text.AlignHCenter
        anchors.bottom: progressBar.top
        anchors.bottomMargin: 50
        anchors.top: gear.bottom
        anchors.topMargin: 50
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 22
    }

    ProgressBar {
        id: progressBar
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        indeterminate: true
        anchors.right: parent.right
        anchors.rightMargin: 50
        anchors.left: parent.left
        anchors.leftMargin: 50
    }


}

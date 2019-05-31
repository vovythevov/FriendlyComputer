import QtQuick 2.10
import QtQuick.Controls 2.0
import QtQuick.Window 2.3

QtObject {
    property var splashWindow: Splash {
        width: Screen.width / 3
        height: Screen.height / 3
        duration: 2000
        onTimeout: mainWindow.visible = true
    }

    property var mainWindow: Window {
        id: window
        width: Screen.width / 2
        height: Screen.height / 2
        x: (Screen.width - window.width) / 2
        y: (Screen.height - window.height) / 2

        title: "Operating system"
        visible: false

        Image {
            id: gear
            width: window.width * 0.5
            height: window.height * 0.5
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
}

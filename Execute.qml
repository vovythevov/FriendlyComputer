import QtQuick 2.10
import QtQuick.Controls 2.5
import QtQuick.Window 2.3
import QtQuick.Dialogs 1.3

Item {
    id: execute

    signal error()

    property date nextAlert: new Date()

    Timer {
        id: countdown
        interval: 100
        onTriggered: {

        }
    }

    Text {
        id: timerDisplay
        text: qsTr("Text")
        anchors.top: parent.top
        anchors.topMargin: 20
        anchors.horizontalCenter: parent.horizontalCenter
        font.pixelSize: 12
    }

    Component.onCompleted: {
        console.log("\\todo: Change base alert time")
        getNextAlert()
        countdown.start()
    }

    function getNextAlert() {
        var baseAlertTime = 10
    }
}

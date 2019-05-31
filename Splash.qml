
import QtQuick 2.0
import QtQuick.Window 2.1

Window {
    id: splash
    color: "transparent"
    title: "Splash Window"
    modality: Qt.ApplicationModal
    flags: Qt.SplashScreen
    property int duration: 2000
    signal timeout
    x: (Screen.width - splashImage.width) / 2
    y: (Screen.height - splashImage.height) / 2

    Image {
        id: splashImage
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        source: "Icons/Dharma_Initiative_logo.svg"
    }
    Timer {
        interval: duration
        running: true
        repeat: false
        onTriggered: {
            visible = false
            splash.timeout()
        }
    }
    Component.onCompleted: visible = true
}

import QtQuick 2.10
import QtQuick.Controls 2.0
import QtQuick.Window 2.3

Item {
  id: boot

  signal finished()


  property int currentQuote: 0
  property int maxNumberOfQuotes: 2
  property var quote: [
    "Reticulating splines",
    "Setting time and space variables",
    "Upgrading framework",
    "Checking the gravitational constant in your locale",
    "Calibrating satellites into position",
    "Embiggening Prototypes",
    "Creating time-loop inversion field",
    "Computing chance of success",
    "Adjusting flux capacitor.",
    "Transcoding firewall",
    "Inversing matrices",
    "Translocating datasets",
    "Interfacing hardware",
    "Opening ports",
    "Enhancing cross-platform support",
    "Receiving packets",
    "Decompressing resources",
  ]

  Image {
      id: gear
      width: boot.width * 0.5
      height: boot.height * 0.5
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
      id: loadingText
      text: quote[currentQuote]
      horizontalAlignment: Text.AlignHCenter
      anchors.bottom: progressBar.top
      anchors.bottomMargin: 50
      anchors.top: gear.bottom
      anchors.topMargin: 50
      anchors.horizontalCenter: parent.horizontalCenter
      font.pixelSize: 40
  }

  ProgressBar {
      id: progressBar
      height: 25
      anchors.bottom: parent.bottom
      anchors.bottomMargin: 50
      indeterminate: true
      anchors.right: parent.right
      anchors.rightMargin: 50
      anchors.left: parent.left
      anchors.leftMargin: 50
  }

  Timer {
      id: loadingTextTimer
      interval: 4000
      onTriggered: {
          currentQuote = currentQuote + 1
          if (currentQuote >= maxNumberOfQuotes) {
              currentQuote = 0
              boot.finished()
          }
          else {
            loadingTextTimer.interval = 10000 * Math.random()
            loadingTextTimer.start()
          }
      }
  }

  Component.onCompleted: {
      loadingTextTimer.start()
      console.log("\\todo: Change maxNumberOfQuotes")
  }
}

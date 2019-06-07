import QtQuick 2.10
import QtQuick.Controls 2.5
import QtQuick.Window 2.3

QtObject {
    property var splashWindow: Splash {
        width: Screen.width / 3
        height: Screen.height / 3
        duration: 2000
        onTimeout: mainWindow.visible = true
    }

    property var mainWindow: MainWindow {
        id: mainWindow
        width: Screen.width / 2
        height: Screen.height / 2
        //x: (Screen.width - mainWindow.width) / 2
        //y: (Screen.height - mainWindow.height) / 2
    }
}

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

    property var mainWindow: Window {
        id: mainWindow
        width: Screen.width / 2
        height: Screen.height / 2
        x: (Screen.width - mainWindow.width) / 2
        y: (Screen.height - mainWindow.height) / 2

        StackView {
            id: stack
            anchors.fill: parent
            initialItem: boot

            // Boot
            Component {
                id: boot
                Boot {
                    onFinished: stack.push(liquidSetup)
                }
            }

            // Setup
            Component {
                id: liquidSetup
                Setup {
                    expectedValue: 0
                    imageSource: "Icons/WaterDrop.svg"
                    instructionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"

                    onFinished: {
                        stack.pop()
                        stack.push(solidSetup)
                    }
                    onError: errorPopup.open()
                }
            }
            Component {
                id: solidSetup
                Setup {
                    expectedValue: 0
                    imageSource: "Icons/Rock.svg"
                    instructionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"

                    onFinished: {
                        stack.pop()
                        stack.push(gazSetup)
                    }
                    onError: errorPopup.open()
                }
            }
            Component {
                id: gazSetup
                Setup {
                    expectedValue: 0
                    imageSource: "Icons/Wind.svg"
                    instructionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"

                    onFinished: console.log("Finished gaz setup")
                    onError: errorPopup.open()
                }
            }
        }

        Popup {
            id: errorPopup
            padding: 40
            modal: true
            dim: true
            closePolicy: Popup.NoAutoClose
            Error {
                instructionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
                onFinished: errorPopup.close()
            }
        }
    }
}

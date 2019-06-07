import QtQuick 2.10
import QtQuick.Controls 2.5
import QtQuick.Window 2.3

Window {
    id: mainWindow
    width: Screen.width / 2
    height: Screen.height / 2

    Popup {
        id: errorPopup
        modal: true
        dim: true
        width: parent.width - 160
        height: parent.height - 160
        anchors.centerIn: Overlay.overlay
        closePolicy: Popup.NoAutoClose
        contentItem:
        Error {
            instructionText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"
            onFinished: errorPopup.close()
        }
    }

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
}

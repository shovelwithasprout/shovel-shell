import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Widgets
import Quickshell.Services.SystemTray

Item {
    id: root

    required property SystemTrayItem modelData
    required property int index

    implicitWidth: 16
    implicitHeight: 16

    Popup {
        id: trayMenuPopup
        y: root.y + root.height + 8
        contentWidth: 304
        contentHeight: idMenu.contentHeight - 8
        modal: true
        focus: true
        popupType: Popup.Window
        topInset: -2
        leftInset: -2
        rightInset: -2
        bottomInset: -2

        background: Rectangle {
            color: bgColor
            radius: 8
            border {
                color: fgColor
                width: 2
            }
        }

        contentItem: TrayItemMenu {
            id: idMenu
            rootMenu: QsMenuOpener { menu: modelData.menu }
            trayMenu: QsMenuOpener { menu: modelData.menu }
        }

        onClosed: {
            idMenu.trayMenu = idMenu.rootMenu
        }
    }

    MouseArea {
        acceptedButtons: Qt.LeftButton | Qt.RightButton
        anchors.fill: parent

        onClicked: event => {
            if (event.button === Qt.LeftButton) {
                modelData.activate();
            } else if (event.button === Qt.RightButton) {
                idMenu.trayMenu.menu = root.modelData.menu
                trayMenuPopup.open();
            }
        }
    }

    IconImage {
        id: icon
        anchors.fill: parent
        asynchronous: true
        source: {
            let icon = root.modelData.icon;
            if (icon.includes("?path=")) {
                const [name, path] = icon.split("?path=");
                icon = `file://${path}/${name.slice(name.lastIndexOf("/") + 1)}`;
            }
            return icon;
        }
    }
}

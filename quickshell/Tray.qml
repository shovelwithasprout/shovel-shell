import Quickshell
import Quickshell.Services.SystemTray
import QtQuick

Item {

    anchors.centerIn: parent
    id: root

    readonly property Repeater items: items

    clip: true
    visible: width > 0 && height > 0 // To avoid warnings about being visible with no size

    implicitWidth: layout.implicitWidth
    implicitHeight: layout.implicitHeight

    Row {
        id: layout

        spacing: 4

        Repeater {
            id: items

            model: ScriptModel {
              values: [...SystemTray.items.values]
            }

            TrayItem {
            }
        }
    }
}
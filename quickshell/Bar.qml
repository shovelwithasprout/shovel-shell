//@ pragma UseQApplication

import Quickshell
import Quickshell.Services.SystemTray
import Quickshell.Io
import QtQuick
import QtQuick.Layouts

PanelWindow {
  id: bar

  anchors {
    top: true
    left: true
    right: true
  }

  implicitHeight: 40
  color: bgColor

  // sections
  // left
  RowLayout {
    anchors.verticalCenter: parent.verticalCenter
    anchors.leftMargin: 5
    anchors.left: parent.left
    layoutDirection: Qt.LeftToRight
    spacing: 5

  // mpris
    BarItem {
      color: !mouse.containsMouse ? bgColorLight : fgColor
      
      Mpris {}

      MouseArea {
        id: mouse
        anchors.fill: parent 
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton | Qt.RightButton

        onClicked: event => {
          if (event.button === Qt.LeftButton)
            rmpcProc.running = !rmpcProc.running
          else if (event.button === Qt.RightButton)
            MusicManager.playPause();
        }

      }

      Process {
        id: rmpcProc
        command: [ "kitty", "rmpc" ]
      }

    }
  
  // workspaces
    BarItem {
      Workspaces {}
    }
  }
  // center
  RowLayout {
    anchors.verticalCenter: parent.verticalCenter
    anchors.horizontalCenter: parent.horizontalCenter

    // clock
    BarItem {
      Text {
        anchors.centerIn: parent
        color: fgColor
        text: Time.time
      }
    }
  }

  // right
  RowLayout {
    anchors.verticalCenter: parent.verticalCenter
    anchors.rightMargin: 5
    anchors.right: parent.right
    layoutDirection: Qt.RightToLeft

  // power
    BarItem {
      Power {}
    }

  // pipewire
    BarItem {
      color: volumeMouse.containsMouse ? fgColor : bgColorLight

      Pipewire {
        property var volumeMouse: volumeMouse
      }

      MouseArea {
        id: volumeMouse
        anchors.fill: parent 
        hoverEnabled: true
        acceptedButtons: Qt.LeftButton
        
        onClicked: event => {
        if (event.button === Qt.LeftButton) {
          volumeProc.running = true;
        }
      }
      }

      Process {
        id: volumeProc
        command: [ "pavucontrol" ]
      }
    }

  // brightness
    BarItem {
      Brightness {}
    }

  // tray
    BarItem {
      visible: SystemTray.items.values.length != 0
      Tray {}
    }
  }
}
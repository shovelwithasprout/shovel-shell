import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Layouts 

RowLayout {
  anchors.centerIn: parent
  property int curBrightness
  property string icon: getIcon()

  function getIcon() {
    if (curBrightness <= 25) return "󰃞  "
    else if (curBrightness <= 50) return "󰃟  "
    else if (curBrightness <= 75) return "󰃝  "
    else return "󰃠  "
  }

  Text {
    color: fgColor
    text: icon + curBrightness + "%"
  }
  
  Process {
    id: brightnessProc
    running: true
    command: ["brightnessctl", "g"]
    stdout: StdioCollector {
      id: brightnessOutput
      onStreamFinished: curBrightness = Math.round(text / 1200)
    }
  }

  Timer {
    id: brightnessTimer
    interval: 500
    repeat: true
    running: true
    onTriggered: brightnessProc.running = true
  }
}
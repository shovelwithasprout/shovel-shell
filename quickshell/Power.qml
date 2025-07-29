import QtQuick
import QtQuick.Layouts
import Quickshell.Services.UPower

RowLayout {
  anchors.centerIn: parent
  property real percentage: Math.floor(UPower.displayDevice.percentage * 100)
  property string icon: isCharging()
  property var batteryIcons: [
    "󰂎",
    "󰁺",
    "󰁻",
    "󰁼",
    "󰁽",
    "󰁾",
    "󰁿",
    "󰂀",
    "󰂁",
    "󰂂",
    "󰁹"
  ]

  property var batteryIconsCharging: [
    "󰢟",
    "󰢜",
    "󰂆",
    "󰂇",
    "󰂈",
    "󰢝",
    "󰂉",
    "󰢞",
    "󰂊",
    "󰂋",
    "󰂅"
  ]

  function isCharging() {
    const index = Math.floor(percentage / 10);
    if (UPower.displayDevice.state == 5) {
      return batteryIconsCharging[index] + "󰚥 "
    }
    else if (UPower.displayDevice.state == 1 || UPower.displayDevice.state == 4) {
      return batteryIconsCharging[index] + "  "
    }
    else return batteryIcons[index] + " "
  }

  Text {
    anchors.centerIn: parent
    color: fgColor
    text: icon + percentage + "%"
  }
}


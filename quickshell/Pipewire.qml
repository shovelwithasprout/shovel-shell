import Quickshell
import Quickshell.Io
import Quickshell.Services.Pipewire
import QtQuick
import QtQuick.Layouts

RowLayout {
  anchors.centerIn: parent
  property real volume: Math.floor(Pipewire.defaultAudioSink.audio.volume * 100)
  property string icon: isMuted()

  function isMuted() {
    if (Pipewire.defaultAudioSink.audio.muted | volume == 0) {
      return "󰝟  "
    }
    else if (volume <= 30) {
      return "󰕿  "
    }
    else if (volume <= 60) {
      return "󰖀  "
    }
    else return "󰕾  "
  }

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink, Pipewire.defaultAudioSource]
  }

  Text {
    anchors.centerIn: parent
    color: !volumeMouse.containsMouse ? fgColor : bgColor
    text: icon + volume + "%"
  }
}
import Quickshell
import QtQuick
import QtQuick.Layouts

RowLayout {
  anchors.centerIn: parent
  property string icon: playerState()

  function playerState() {
    if (MusicManager.isPlaying) {
      return "  "
    }
    else return "  "
  }

  Text {
    anchors.centerIn: parent 
    color: !mouse.containsMouse ? fgColor : bgColor
    text: icon + MusicManager.trackTitle + " • " + MusicManager.trackArtist
  }
}
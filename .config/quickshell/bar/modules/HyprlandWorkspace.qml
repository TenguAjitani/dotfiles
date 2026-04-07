import QtQuick
import Quickshell
import Quickshell.Hyprland
// Rectangle {
//   width: 20
//   height: 100
//   radius: 15
  Column{
    spacing: 8
    Repeater{
      model: Hyprland.workspaces
      Rectangle {
        width: 24
        height: 16
        radius: 16
        border {
          color: "#4a9eff"
          // color: "#C51313"
          width: 1
        }
        color: modelData.active ? "#bbd4ff" : "#010113"
        // color: modelData.active ? "#E3E3E3" : "#110103"
        MouseArea {
          anchors.fill: parent
          onClicked: Hyprland.dispatch("workspace " + modelData.id)
        }
      }
    }
  }
// }




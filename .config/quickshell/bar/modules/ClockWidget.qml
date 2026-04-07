// ClockWidget.qml
import QtQuick
import "../services"
// Rectangle {
//   id: timeModule
//   width: 30
//   height: 100
//   color: "transparent"
Column{
  anchors.horizontalCenter: parent.horizontalCenter
  Text {
    id: hourText
    text: Time.format("h")
    color: "white"
    font.pixelSize: 24
    font.family: "Maple Mono Nerd Font CN"
    font.weight: Font.Bold
  }
  Text {
    id: minuteText
    text: Time.format("mm")
    color: "white"
    font.pixelSize: 24
    font.family: "Maple Mono Nerd Font CN"
    font.weight: Font.Bold
  }
}
// }

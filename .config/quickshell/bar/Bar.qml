import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell
import Quickshell.Wayland
import Quickshell.Hyprland
import "./modules/"

PanelWindow {
  id: root
  anchors {
    top: true
    // left: true
    bottom: true
    right: true
  }

  // implicitHeight: 30
  implicitWidth: 40
    margins {
    top: 10
    right: 5
    bottom: 10
  }

  visible: true
  color: "transparent"
  Rectangle {
    id: bar
    anchors.fill: parent
    color: "#010123"
    // color: "#141313"
    border {
      color: "#011331"
    }
    radius: 5
    Row{
      id: topWidget
      anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
        topMargin: 10
      }
      // spacing: 10
      HyprlandWorkspace {
        anchors.verticalCenter: parent.verticalCenter
      }
    }

    Row {
      id: centerWidget
      anchors {
        centerIn: parent
        // horizontalCenter: parent.horizontalCenter
      }
      spacing: 0
      ClockWidget {
        anchors.verticalCenter: parent.verticalCenter
      }
    }

    Row {
      id: bottomWidget
      anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
        bottomMargin: 10
      }
      spacing: 0
      Battery {
        anchors.verticalCenter: parent.verticalCenter
      }
    }
    
    opacity: 0.8
  }
}


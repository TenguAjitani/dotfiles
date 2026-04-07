pragma Singleton

import Quickshell
import QtQuick
Singleton {
  SystemClock {
    id: clock
    precision: SystemClock.Seconds
  }

  property alias enabled: clock.enabled
  readonly property date date: clock.date
  readonly property int hours: clock.hours
  readonly property int minutes: clock.minutes
  readonly property int seconds: clock.seconds

  function format(fmt: string): string {
      return Qt.formatDateTime(clock.date, fmt);
  }
}

/// Time.qml
// Singleton {
//   SystemClock {
//     id: clock
//     precision: SystemClock.Seconds
//   }
//
//   id: root
//   readonly property string time: {
//     Qt.formatDateTime(clock.date, "h:mm")
//   }
// }

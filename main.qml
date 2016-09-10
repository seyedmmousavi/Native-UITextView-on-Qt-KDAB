import QtQuick 2.4
import QtQuick.Window 2.2
import QtQuick.Controls 1.2
import MyTextView 1.0

Window {
    visible: true

    Column {
        anchors.fill: parent
        anchors.margins: 5
        spacing: 5

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 100
            border.width: 1
            border.color: "red"
            color: "#cccccc"

            MyTextView {
                anchors.fill: parent
                anchors.margins: 1
            }
        }
    }
}

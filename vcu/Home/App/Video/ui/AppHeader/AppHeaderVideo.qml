import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../HomeScreen/ui/utilities"

AppHeader {
    id: appHeaderVideoRootID
    Text {
        id: appVideoTitleID
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Video"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.5
    }
}
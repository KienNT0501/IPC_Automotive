import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../HomeScreen/ui/utilities"

AppHeader {
    id: appHeaderClimateRootID
    Text {
        id: appClimateTitleID
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Climate"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.5
    }
}
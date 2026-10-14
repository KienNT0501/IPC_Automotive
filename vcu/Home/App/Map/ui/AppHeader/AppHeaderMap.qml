import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../HomeScreen/ui/utilities"

AppHeader {
    id: appHeaderMapRootID
    Text {
        id: appMapTitleID
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Map"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.5
    }
}
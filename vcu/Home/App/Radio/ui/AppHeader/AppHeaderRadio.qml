import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../HomeScreen/ui/utilities"

AppHeader {
    id: appHeaderRadioRootID
    Text {
        id: appRadioTitleID
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Radio"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.5
    }
}
import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../HomeScreen/ui/utilities"

AppHeader {
    id: appHeaderPhoneRootID
    Text {
        id: appPhoneTitleID
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Phone"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.5
    }
}
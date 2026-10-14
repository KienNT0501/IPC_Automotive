import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../../../HomeScreen/ui/utilities"

AppHeader {
    id: appHeaderSettingsRootID
    Text {
        id: appSettingsTitleID
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Settings"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.5
    }
}
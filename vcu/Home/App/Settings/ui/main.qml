import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "AppHeader"


Item {
    id: settingsWindow
    visible: true

    Image {
        id: settings_bgID
        anchors.fill: parent
        source: "qrc:/Img/Media/background.png"
    }
    AppHeaderSettings {
        id: appHeaderSettingsID
        width: parent.width
        height: parent.height * 0.1
    }

}

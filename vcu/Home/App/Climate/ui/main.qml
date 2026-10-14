import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "AppHeader"


Item {
    id: climateWindow
    visible: true

    Image {
        id: cli_bgID
        anchors.fill: parent
        source: "qrc:/Img/Media/background.png"
    }
    AppHeaderClimate {
        id: appHeaderClimateID
        width: parent.width
        height: parent.height * 0.1
    }

}

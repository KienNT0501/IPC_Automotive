import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "AppHeader"


Item {
    id: videoWindow
    visible: true

    Image {
        id: video_bgID
        anchors.fill: parent
        source: "qrc:/Img/Media/background.png"
    }
    AppHeaderVideo {
        id: appHeaderVideoID
        width: parent.width
        height: parent.height * 0.1
    }

}

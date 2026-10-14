import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "AppHeader"


Item {
    id: radioWindow
    visible: true

    Image {
        id: radio_bgID
        anchors.fill: parent
        source: "qrc:/Img/Media/background.png"
    }
    AppHeaderRadio {
        id: appHeaderRadioID
        width: parent.width
        height: parent.height * 0.1
    }

}

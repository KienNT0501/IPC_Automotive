import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "AppHeader"


Item {
    id: phoneWindow
    visible: true

    Image {
        id: phone_bgID
        anchors.fill: parent
        source: "qrc:/Img/Media/background.png"
    }
    AppHeaderPhone {
        id: appHeaderPhoneID
        width: parent.width
        height: parent.height * 0.1
    }

}

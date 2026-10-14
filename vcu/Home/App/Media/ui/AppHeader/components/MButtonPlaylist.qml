import QtQuick 2.15
import QtQuick.Controls 2.15

MouseArea {
    id: mButtonPlstMdaID
    property string icon_on: ""
    property string icon_off: ""
    property int status: 0 //0-Off 1-On
    signal plstButtonClicked()
    implicitWidth: img.width
    implicitHeight: img.height
    Image {
        id: img
        anchors.fill: parent
        source: mButtonPlstMdaID.status === 0 ? icon_off : icon_on
    }
    onClicked: {
        status = !status
        plstButtonClicked()
    }
}
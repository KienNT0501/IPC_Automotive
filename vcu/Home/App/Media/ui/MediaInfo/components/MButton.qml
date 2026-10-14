import QtQuick 2.15
import QtQuick.Controls 2.15

MouseArea {
    id: mButtonMdaID
    property string icon_pressed: ""
    property string icon_released: ""
    property string icon_default: ""
    property var widthItem
    property var heightItem
    property string buttonType
    signal nextButton()

    implicitWidth: img.width
    implicitHeight: img.height
    Image {
        id: img
        source: mButtonMdaID.icon_default
        width: mButtonMdaID.widthItem
        height: mButtonMdaID.heightItem
    }
    onPressed: {
        img.source = icon_pressed
        switch(buttonType) {
            case "prev":
                Player.previous()
            break
            case "next":
                Player.next()
            break
        }
    }
    onReleased: {
        img.source = icon_released
    }
}
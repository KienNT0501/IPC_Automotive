import QtQuick 2.15 

MouseArea {

    id: mButtonAtomicID
    property string icon_pressed: ""
    property string icon_released: ""
    property string icon_default: ""
    property var widthItem
    property var heightItem
    property string buttonType
    property bool active: false

    signal reqOffReplay()
    signal reqOffShuff()
    implicitWidth: imgButtonAtomicID.width
    implicitHeight: imgButtonAtomicID.height

    Image {
        id: imgButtonAtomicID

        source: mButtonAtomicID.active
                 ? mButtonAtomicID.icon_pressed
                 : mButtonAtomicID.icon_released

        width: mButtonAtomicID.widthItem
        height: mButtonAtomicID.heightItem
    }

    onClicked: {
        switch (buttonType) {
        
        case "shuffle":
    
            if (!active) {
                reqOffReplay()
            }
    
            active = !active
            Player.shuffleButtonState(active)
    
            break
    
    
        case "replay":
    
            if (!active) {
                reqOffShuff()
            }
    
            active = !active
            Player.replayButtonState(active)
    
            break
        }
    }
}
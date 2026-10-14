import QtQuick 2.15

MouseArea {
    id: mButtonPlayID
    property string icon_pressWpause: ""
    property string icon_releaseWpause: ""
    property string icon_pressWplay: ""
    property string icon_releaseWplay: ""
    property string icon_default: ""
    property var buttonWidth
    property var buttonHeight
    property bool isPause: true
    implicitWidth: imgButtonPlayID.width
    implicitHeight: imgButtonPlayID.height
    Image {
        id: imgButtonPlayID
        source: mButtonPlayID.icon_default
        height: mButtonPlayID.buttonHeight
        width: mButtonPlayID.buttonWidth
    }

    onPressed: {
        
        switch (isPause) {
            case true:
                imgButtonPlayID.source = icon_pressWpause
            break
            case false:
                imgButtonPlayID.source  = icon_pressWplay
            break
        }
        isPause = !isPause
    }

    onReleased: {
        console.log("play released!")
        switch (isPause) {
            case true:
                imgButtonPlayID.source =  icon_releaseWpause
                Player.onoffState(true);
                Player.start()
            break
            case false:
                imgButtonPlayID.source = icon_releaseWplay
                Player.onoffState(false);
                Player.stop()
            break
        }
    }
}
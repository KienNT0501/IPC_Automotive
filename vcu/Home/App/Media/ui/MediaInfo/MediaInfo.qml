import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15
import "components"
Item {
    id: mediaInfoID
    signal dimensionChanged()
    property bool isDrawerOpened: false
    property bool isOpening:false
    property bool isReturning:false
    property var currInd: 0

    Connections {
           target: Player

            function onCurrentIndexChanged(index) {
                currInd = index
                musicArtistID.text = PlaylistModel.data(PlaylistModel.index(currInd,0), 257)
                musicNameID.text = PlaylistModel.data(PlaylistModel.index(currInd,0), 258)
           }
        }

    MButton {
        id: nextbuttonId
        buttonType: "next"
        anchors.right: mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.35
                            : mediaInfoID.width * 0.385
        y: mediaInfoID.height * 0.85
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }

        widthItem:  isDrawerOpened 
                    ? mediaInfoID.width * 0.085
                    : mediaInfoID.width * 0.07
        heightItem: isDrawerOpened 
                    ? mediaInfoID.width * 0.055
                    : mediaInfoID.height * 0.075
        icon_default: "qrc:/Img/Media/next.png"
        icon_pressed: "qrc:/Img/Media/hold-next.png"
        icon_released: "qrc:/Img/Media/next.png"
    }

    MButtonPlay {
        id: playbuttonId
        anchors.right: mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.44
                            : mediaInfoID.width * 0.46
                         y: isDrawerOpened 
                            ? nextbuttonId.y * 0.95
                            :nextbuttonId.y * 0.95
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }
        buttonWidth:  isDrawerOpened 
                    ? mediaInfoID.width * 0.12
                    : mediaInfoID.width * 0.08
        buttonHeight: isDrawerOpened 
                    ? mediaInfoID.width * 0.12
                    : mediaInfoID.height * 0.158
        icon_pressWpause: "qrc:/Img/Media/hold-pause.png"
        icon_releaseWpause: "qrc:/Img/Media/pause.png"
        icon_pressWplay: "qrc:/Img/Media/hold-play.png"
        icon_releaseWplay: "qrc:/Img/Media/play.png"
        icon_default: "qrc:/Img/Media/pause.png"

    }

    MButton {
        id: prevbuttonId
        buttonType: "prev"
        anchors.right: mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.565
                            : mediaInfoID.width * 0.545
        y: mediaInfoID.height * 0.85

        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }

        widthItem:  isDrawerOpened 
                    ? mediaInfoID.width * 0.085
                    : mediaInfoID.width * 0.07
        heightItem: isDrawerOpened 
                    ? mediaInfoID.width * 0.055
                    : mediaInfoID.height * 0.075
        icon_default: "qrc:/Img/Media/prev.png"
        icon_pressed: "qrc:/Img/Media/hold-prev.png"
        icon_released: "qrc:/Img/Media/prev.png"
    }

    MButtonAtomic {
        id: shufflebuttonId
        buttonType: "shuffle"
        anchors.verticalCenter: playbuttonId.verticalCenter
        anchors.right: mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.1
                            : mediaInfoID.width * 0.15
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }
        widthItem:  isDrawerOpened 
                    ? mediaInfoID.width * 0.085
                    : mediaInfoID.width * 0.07
        heightItem: isDrawerOpened 
                    ? mediaInfoID.width * 0.055
                    : mediaInfoID.height * 0.075                                            
        icon_default: "qrc:/Img/Media/shuffle.png"
        icon_pressed: "qrc:/Img/Media/shuffle-1.png"
        icon_released: "qrc:/Img/Media/shuffle.png"
            
        onReqOffReplay: {
            console.log("reqOffReplay!")
            replaybuttonId.active = false
            Player.replayButtonState(false)
        }
    }

    MButtonAtomic {
        id: replaybuttonId
        buttonType: "replay"
        anchors.verticalCenter: playbuttonId.verticalCenter
        anchors.right: mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.82
                            : mediaInfoID.width * 0.78

        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }
        widthItem:  isDrawerOpened 
                    ? mediaInfoID.width * 0.085
                    : mediaInfoID.width * 0.07
        heightItem: isDrawerOpened 
                    ? mediaInfoID.width * 0.055
                    : mediaInfoID.height * 0.075                                            
        icon_default: "qrc:/Img/Media/repeat.png"
        icon_pressed: "qrc:/Img/Media/repeat1_hold.png"
        icon_released: "qrc:/Img/Media/repeat.png"

        onReqOffShuff: {
            console.log("reqOffShuff!")
            shufflebuttonId.active = false
            Player.shuffleButtonState(false)
        }
    }

    ProgressBar {
        id: progressBarID

        screenWidth: mediaInfoID.width
        screenHeight: mediaInfoID.height
        width: parent.width
        height: parent.height
        isDrawerOpened: mediaInfoID.isDrawerOpened
        currPos: Player.m_position
        currDuration: Player.m_duration
        pointSource: "qrc:/Img/Media/point.png"
        centerPointSource: "qrc:/Img/Media/center_point.png"
    }
    

    Text {
        id: currentTimeID

        text: "00:00" 

        anchors.right : mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.88
                            : mediaInfoID.width * 0.88
        y: mediaInfoID.height * 0.73
        font.pixelSize: isDrawerOpened
                        ? mediaInfoID.width * 0.018
                        : mediaInfoID.width * 0.015
        color: "#FFFFFF"
        font.family: "Roboto"
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear 
            }
        }
        Behavior on  font.pixelSize {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear 
            }
        }

        Connections {
            target: Player
            function onPositionChanged(strPosition){
                currentTimeID.text = strPosition
            }
        }
    }

    Text {
        id: stopTimeID
        text: (PlaylistModel.rowCount() === 0 ) ? "00:00" 
                                                : Player.formatTime(Player.duration())

                                                
        anchors.right : mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.07
                            : mediaInfoID.width * 0.085
        y: mediaInfoID.height * 0.73
        font.pixelSize: isDrawerOpened
                        ? mediaInfoID.width * 0.018
                        : mediaInfoID.width * 0.015
        color: "#FFFFFF"
        font.family: "Roboto"
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear 
            }
        }
        Behavior on  font.pixelSize {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear 
            }
        }
        Connections {
            target: Player
            function onDurationChanged(strDuration){
                stopTimeID.text = strDuration
            }
        }
    }

    Image {
        id:musicIcondID
        source:"qrc:/Img/Media/music.png"
        anchors.right: mediaInfoID.right
       
        anchors.rightMargin: isDrawerOpened
                            ? mediaInfoID.width * 0.08
                            : mediaInfoID.width * 0.06
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }
        y: mediaInfoID.height * 0.02
        height: isDrawerOpened
                ? mediaInfoID.height * 0.06
                : mediaInfoID.height * 0.06
        width: isDrawerOpened
                ? mediaInfoID.height * 0.06
                : mediaInfoID.height * 0.06
        
    }

    Text {
        id: musicNumbID
        text: PlaylistModel.rowCount()
        color: "#FFFFFF"
        font.pixelSize: isDrawerOpened
                        ? mediaInfoID.width * 0.04
                        : mediaInfoID.width * 0.03
        font.family: "Roboto"
        font.bold: true
        y: mediaInfoID.height * 0.01
        anchors.right: mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                        ? mediaInfoID.width * 0.02
                        : mediaInfoID.width * 0.02
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200   
            }
        }
        Behavior on font.pixelSize {
            NumberAnimation {
                duration: 200   
            }
        }
    }


    NumberAnimation {
        id: textChangeAni
        property: "opacity"
        from: 0
        to: 1
        duration: 400
        easing.type: Easing.InOutQuad
    }

    Text {
        id: musicNameID

        text: PlaylistModel.data(PlaylistModel.index(Player.currentIndex(),0), 258)


        color: "#FFFFFF"
        font.pixelSize: isDrawerOpened
                        ? mediaInfoID.width * 0.03
                        : mediaInfoID.width * 0.02
        font.family: "Roboto"
        font.bold: true
        y: mediaInfoID.height * 0.01
        anchors.left: mediaInfoID.left
        anchors.leftMargin: isDrawerOpened
                        ? mediaInfoID.width * 0.05
                        : mediaInfoID.width * 0.01
        Behavior on anchors.leftMargin {
            NumberAnimation {
                duration: 200   
            }
        }
        Behavior on font.pixelSize {
            NumberAnimation {
                duration: 200   
            }
        }

        onTextChanged: {
            textChangeAni.restart()
        }
    }

    Text {
        id: musicArtistID
        text: PlaylistModel.data(PlaylistModel.index(Player.currentIndex(),0), 257)
                                                
        color: "#FFFFFF"
        font.pixelSize: isDrawerOpened
                        ? mediaInfoID.width * 0.03
                        : mediaInfoID.width * 0.02
        font.family: "Roboto"
        font.bold: true
        y: mediaInfoID.height * 0.07
        anchors.left: mediaInfoID.left
        anchors.leftMargin: isDrawerOpened
                        ? mediaInfoID.width * 0.05
                        : mediaInfoID.width * 0.03
        Behavior on anchors.leftMargin {
            NumberAnimation {
                duration: 200 
            }
        }
        Behavior on font.pixelSize {
            NumberAnimation {
                duration: 200   
            }
        }
        onTextChanged: {
            textChangeAni.targets = [musicNameID,musicArtistID]
            textChangeAni.restart()
        }
    }

    AlbumArt {
        id: albumArtID


        y: isDrawerOpened 
            ? mediaInfoID.height * 0.2
            : mediaInfoID.height * 0.15

        anchors.right: mediaInfoID.right
        anchors.rightMargin: isDrawerOpened
                        ? mediaInfoID.width * 0.22
                        : mediaInfoID.width * 0.27
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200   
            }
        }
        width:  isDrawerOpened 
                    ? mediaInfoID.width * 0.9
                    : mediaInfoID.width * 0.75
        Behavior on width {
            NumberAnimation {
                duration: 100   
            }
        }
        height: isDrawerOpened 
                    ? mediaInfoID.height * 0.4
                    : mediaInfoID.height * 0.5
        Behavior on height {
            NumberAnimation {
                duration: 100   
            }
        }
        albumArtWidth: width
    }
}
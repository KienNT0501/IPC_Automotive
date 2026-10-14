import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
    

    MouseArea {
        id: mediaMouseAreaID

        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.05

        anchors.fill: parent

        hoverEnabled: true
        onEnabledChanged: state = ""

        Rectangle{
            id: mediaRectID
            anchors {
                fill: parent
                margins: parent.width * 0.02
            }
            opacity: 0.7
            color: "transparent"
        }
        Image {
            id: bgMediaBlurID
            anchors.centerIn: parent
            width: mediaRectID.width 
            height: mediaRectID.height
            source: {
                if (Playlist.currentIndex >= 0)
                    return PlaylistModel.data(
                                PlaylistModel.index(Playlist.currentIndex,0),259)

                return "qrc:/Img/Media/album_art.png"
            }
        }

        onEntered: {
            mediaMouseAreaID.state = "focus"
        }

        onPressed: {
            mediaMouseAreaID.state = "pressed"
        }

        onExited: {
            mediaMouseAreaID.state = "disable"
        }

        states: [
            State {
                name: "focus"
                PropertyChanges {
                    target: bgMediaStateID
                    source: "qrc:/Img/HomeScreen/bg_widget_f.png"
                }
            },

            State {
                name: "pressed"
                PropertyChanges {
                    target: bgMediaStateID
                    source: "qrc:/Img/HomeScreen/bg_widget_p.png"
                }
            }

        ]

        Image {
            id: bgMediaStateID
            anchors.centerIn: parent
            width: mediaRectID.width * 1.04
            height: mediaRectID.height * 1.04
            source: ""
        }

        Image {
            id: bgMediaInnerID
            anchors.centerIn: parent
            width: mediaRectID.width * 0.4
            height: mediaRectID.height * 0.5
            source: {
                if (Playlist.currentIndex >= 0
                        && Playlist.currentIndex < PlaylistModel.rowCount())
                    return PlaylistModel.data(
                                PlaylistModel.index(Playlist.currentIndex,0),
                                259)

                return "qrc:/Img/HomeScreen/cover_art.jpg"
            }
            Rectangle {
                id: borderMediaInnerID
                    anchors.fill: parent
                    color: "transparent"
                    border.color: "#FFFFFF"
                    border.width: parent.width * 0.02
            }
        }

        Text {
            id: textUsbMusicID
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.07
            text: "USB Music"
            color: "#FFFFFF"
            font.pixelSize: parent.height * 0.08
        }

        Text {
            id: textSingerMediaID
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.75
            font.pixelSize: parent.height * 0.08
            color: "#FFFFFF"
            text: {
                if (PlaylistModel.rowCount() > 0
                        && Playlist.currentIndex >= 0
                        && Playlist.currentIndex < PlaylistModel.rowCount())
                    return PlaylistModel.data(PlaylistModel.index(Playlist.currentIndex,0), 258)

                return ""
            }
        }

        Text {
            id: textTitleMediaID
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.84
            font.pixelSize: parent.height * 0.08
            color: "#FFFFFF"
            text: {
                if (PlaylistModel.rowCount() > 0
                        && Playlist.currentIndex >= 0
                        && Playlist.currentIndex < PlaylistModel.rowCount())
                    return PlaylistModel.data(PlaylistModel.index(Playlist.currentIndex,0), 257)

                return ""
            }
        }

        Image {
            id: imgDurationMediaID
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.035
            height: parent.height * 0.015
            width: parent.width * 0.85
            source: "qrc:/Img/HomeScreen/widget_media_pg_n.png"
        }

        Image {
            id: imgPositionMediaID
            anchors.left: imgDurationMediaID.left
            height: imgDurationMediaID.height
            y: imgDurationMediaID.y
            width: 0
            source: "qrc:/Img/HomeScreen/widget_media_pg_s.png"
        }

        Connections {
            target: Player
            function onPositionChanged() {
                imgPositionMediaID.width = (Player.m_position / Player.m_duration) * imgDurationMediaID.width
            }
        }
    }

    
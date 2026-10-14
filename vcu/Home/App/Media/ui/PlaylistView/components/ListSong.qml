import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
        id: listViewRootID

        signal listViewSelected (int index)

        Connections {
            target: listViewRootID
            function onListViewSelected (index) {
                Player.updateListViewPresent(index)
            }
        }

        Connections {
            target: Player
            function onCurrentIndexChanged(index)  {
                listViewID.currentIndex = index
            }
        }

        ListView {
            id: listViewID
            anchors.fill: parent
            model: PlaylistModel
            clip: true

            currentIndex: Playlist.currentIndex

            delegate: MouseArea {
                property variant myData: model
                width: listViewID.width
                height: listViewID.height / 5
                Image {
                    id: playlistItem
                    anchors.fill: parent
                    source: "qrc:/Img/Media/playlist.png"
                    opacity: 0.5
                }
                Text {
                    text: nameSong
                    anchors.fill: parent
                    anchors.leftMargin: listViewID.width * 0.15
                    font.pixelSize: listViewID.width * 0.05
                    verticalAlignment: Text.AlignVCenter
                    color: "#FFFFFF"
                }

                onClicked: {
                    listViewRootID.listViewSelected (index)
                }
            }
            highlight: Rectangle {

                        opacity: 0.5
                        width: listViewID.width
                        height: listViewID.height / 5
                        color:"#0F0F10"
                        Image {
                            anchors.fill: parent
                            source: "qrc:/Img/Media/hold.png"
                        }
                        Image {
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: listViewID.width * 0.05
                            width: listViewID.width * 0.05
                            height: listViewID.width * 0.05
                            source:"qrc:/Img/Media/playing.png"
                            
                        }
            }
            
            ScrollBar.vertical: ScrollBar{}

        }
}
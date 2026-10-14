import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
        id: albumArtRootID

        signal artViewSelected (int index)
        
        Connections {
            target: albumArtRootID
            function onArtViewSelected (index) {
                Player.updateArtViewPresent(index)
            }
        }

        Connections {
            target: Player
        
            function onCurrentIndexChanged(index) {
                albumArtViewID.currentIndex = index
            }
        }

        property var albumArtWidth: 0


    PathView {
            id: albumArtViewID
            anchors.fill:parent

            focus: true
            model: PlaylistModel
            pathItemCount:3
            
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5
            
            currentIndex: Playlist.currentIndex
            delegate: Item {
                id: delegatePathViewID
                width: albumArtRootID.width * 0.3333
                height: albumArtRootID.height
                scale: PathView.itemScale
                Image {
                    id: artistArtID
                    anchors.fill: parent
                    source: imageSource
                }
                MouseArea {
                    anchors.fill:parent
                    onClicked: {
                        albumArtRootID.artViewSelected(index)
                    }
                }
            }
        path: Path {
            startX: albumArtViewID.width * 0.13
            startY: albumArtViewID.height / 2

            PathAttribute { name: "itemScale"; value: 0.6 }
            PathLine { x: albumArtWidth * 0.25; y: albumArtViewID.height / 2 }

            PathAttribute { name: "itemScale"; value: 0.6 }
            PathLine { x: albumArtWidth * 0.5; y: albumArtViewID.height / 2 }

            PathAttribute { name: "itemScale"; value: 1.2 }
            PathLine { x: albumArtWidth * 1.25; y: albumArtViewID.height / 2 }
        }
        Component.onCompleted: {
            console.log ("Current Path View index: ", albumArtViewID.currentIndex)
        }
    }
}
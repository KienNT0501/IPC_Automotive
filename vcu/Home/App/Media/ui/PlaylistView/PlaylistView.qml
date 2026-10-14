import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"
Item {
    
    id: playListViewID

    property bool isOpened: false
    property var axisY: 0
    
    Drawer {
        id: drawerID
        interactive: false
        modal: false
        width: playListViewID.width
        height: playListViewID.height
        y: axisY
        background: Rectangle {
            id: playList_bg
            anchors.fill: parent
            gradient:Gradient{
                GradientStop{position: 0.0;color:"#242428"}
                GradientStop{position: 1.0;color:"#121216"}
            }
        }
        
        ListSong {
            id: listSongID
            anchors.fill: parent
        }

    }
    function drawerOps() {

        switch (isOpened) {
            case true:
                drawerID.close()
                break
            case false:
                drawerID.open()
                break
        }
        isOpened = !isOpened
    }
}

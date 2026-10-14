import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "AppHeader"
import "MediaInfo"
import "PlaylistView"
    
        Item {
            id: mediaWindow
            //implicitWidth: StackView.view.width
            //implicitHeight: StackView.view.height
            
                visible: true
        Image {
            id: med_bgID
            anchors.fill: parent
            source: "qrc:/Img/Media/background.png"
        }

        AppHeaderMedia {
            id: appHeaderMdaID
            height: parent.height * 0.1
            width: parent.width
            onReqDrawerChange: {
                playListMdaID.drawerOps()
                mediaInfoMdaID.dimensionChanged()
            }
        }

        PlaylistView {
            id: playListMdaID
            height: parent.height - appHeaderMdaID.height
            width: parent.width * 0.333
            axisY: (parent.y + appHeaderMdaID.height) * 2.1
        }

        MediaInfo {
            id: mediaInfoMdaID

            anchors.top: appHeaderMdaID.bottom
            anchors.bottom: parent.bottom
            anchors.right: parent.right

            width: isDrawerOpened
                   ? parent.width - playListMdaID.width
                   : parent.width 

            onDimensionChanged: {
                isDrawerOpened = !isDrawerOpened
            }
        }
        
    }
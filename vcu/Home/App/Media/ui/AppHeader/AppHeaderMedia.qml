import QtQuick 2.15
import QtQuick.Controls 2.15
import "components"
import "../../../../HomeScreen/ui/utilities"

AppHeader {
        
        id: appHeaderMediaRootID

        signal reqDrawerChange()
        
    MButtonPlaylist {
        id:mbuttonplaylistId
        icon_on: "qrc:/Img/Media/back.png"
        icon_off: "qrc:/Img/Media/drawer.png"
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: parent.height * 0.1
        height: parent.height * 0.6
        width: parent.height * 0.6

        onPlstButtonClicked: {
            reqDrawerChange()
        }
    }

        Text {

        id: appHeaderMainTitleID
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: parent.height * 0.4
            color: "#FFFFFF"
            
            text: qsTr("STR_MAIN_TITLE")

            Connections {
                target: translator

                function onLanguageChanged() {
                    appHeaderMainTitleID.text = qsTr("STR_MAIN_TITLE")
                }
            }
        }

    Text {
        id: appHeaderPlaylistTitleID
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: mbuttonplaylistId.right
        anchors.leftMargin: parent.height * 0.1
        font.pixelSize: parent.height * 0.3
        color: "#FFFFFF"
        text: qsTr("STR_PLAYLIST_TITLE")
        Connections {
            target: translator
            function onLanguageChanged() {
                appHeaderPlaylistTitleID.text = qsTr("STR_PLAYLIST_TITLE")
            }
        }
        onTextChanged: {
            textChangeAni.targets = [appHeaderPlaylistTitleID, appHeaderMainTitleID]
            textChangeAni.restart()
        }
    }

    NumberAnimation {
    id: textChangeAni
        property: "opacity"
        from: 0
        to: 1
        duration: 400
        easing.type: Easing.OutInQuad
    }
        
}


// Item {
//     property bool imgSelected : false
//     signal reqDrawerChange()
// 
//     Image{
//         
//         id: appHeaderBgID
//         anchors.fill: parent
//         source: "qrc:/Img/Media/title.png"
//     }
// 
//     MButtonPlaylist {
//         id:mbuttonplaylistId
//             icon_on: "qrc:/Img/Media/back.png"
//             icon_off: "qrc:/Img/Media/drawer.png"
//             anchors.verticalCenter: parent.verticalCenter
//             anchors.left: parent.left
//             anchors.leftMargin: parent.height * 0.1
//             height: parent.height * 0.6
//             width: parent.height * 0.6
// 
//                     onPlstButtonClicked: {
//                         reqDrawerChange()
//                     }
// 
//         }
//     Text {
//         id: appHeaderPlaylistTitleID
//             anchors.verticalCenter: parent.verticalCenter
//             anchors.left: mbuttonplaylistId.right
//             anchors.leftMargin: parent.height * 0.1
//             font.pixelSize: parent.height * 0.3
//             color: "#FFFFFF"
//             text: qsTr("STR_PLAYLIST_TITLE")
//             Connections {
//                 target: translator
// 
//                 function onLanguageChanged() {
//                     appHeaderPlaylistTitleID.text = qsTr("STR_PLAYLIST_TITLE")
//                 }
//             }
//         }
//     Text {
// 
//         id: appHeaderMainTitleID
//             anchors.verticalCenter: parent.verticalCenter
//             anchors.horizontalCenter: parent.horizontalCenter
//             font.pixelSize: parent.height * 0.4
//             color: "#FFFFFF"
//             
//             text: qsTr("STR_MAIN_TITLE")
// 
//             Connections {
//                 target: translator
// 
//                 function onLanguageChanged() {
//                     appHeaderMainTitleID.text = qsTr("STR_MAIN_TITLE")
//                 }
//             }
//             onTextChanged: {
//                 textChangeAni.targets = [appHeaderMainTitleID,appHeaderPlaylistTitleID]
//                 textChangeAni.restart()
//             }
//         }
//     NumberAnimation {
//         id: textChangeAni
//             property: "opacity"
//             from: 0
//             to: 1
//             duration: 400
//             easing.type: Easing.OutInQuad
//         }
//     Image {
//         id: vnImgId
//             anchors.verticalCenter: parent.verticalCenter
//             anchors.right: parent.right
//             anchors.rightMargin: parent.height * 0.2
//             height: parent.height * 0.65
//             width: parent.width * 0.035
//             source: "qrc:/Img/Media/vn.png"
//             Rectangle {
//                 width: parent.width
//                 height: parent.height * 0.78
//                 anchors.centerIn: parent
//                 border.color: "#f7f7f7ff"
//                 border.width: height * 0.1
//                 //radius: parent.width * 0.01
//                 color: "transparent"
//                 visible: imgSelected? true:false        
//             }
//             MouseArea{
//                 anchors.fill:parent
//                 onClicked: {
//                       imgSelected = true
//                       translator.setLanguage(1)
//                 }
//             }
//     }
// 
//     Image {
//         id: usImgId
//             anchors.verticalCenter: parent.verticalCenter
//             anchors.right: vnImgId.left
//             anchors.rightMargin: parent.height * 0.2
//             height: parent.height * 0.65
//             width: parent.width * 0.035
//             source: "qrc:/Img/Media/us.png"
//             Rectangle {
//                 width: parent.width
//                 height: parent.height *0.78
//                 anchors.centerIn: parent
//                 border.color: "#f7f7f7ff"
//                 border.width: height * 0.1
//                 //radius: parent.width * 0.01
//                 color: "transparent"
//                 visible: imgSelected? false : true        
//             }
//             MouseArea{
//                 anchors.fill:parent
//                 onClicked: {
//                       imgSelected = false
//                       translator.setLanguage(0)
//                 }
//             }
//     }
// 
// }
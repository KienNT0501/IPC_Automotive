import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    property bool imgSelected : false

    Image{
        
        id: appHeaderBgID
        anchors.fill: parent
        source: "qrc:/Img/Media/title.png"
    }

    Image {
        id: vnImgId
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: parent.height * 0.2
            height: parent.height * 0.65
            width: parent.width * 0.035
            source: "qrc:/Img/Media/vn.png"
            Rectangle {
                width: parent.width
                height: parent.height * 0.78
                anchors.centerIn: parent
                border.color: "#f7f7f7ff"
                border.width: height * 0.1
                color: "transparent"
                visible: imgSelected? true:false        
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                      imgSelected = true
                      translator.setLanguage(1)
                }
            }
    }

    Image {
        id: usImgId
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: vnImgId.left
            anchors.rightMargin: parent.height * 0.2
            height: parent.height * 0.65
            width: parent.width * 0.035
            source: "qrc:/Img/Media/us.png"
            Rectangle {
                width: parent.width
                height: parent.height *0.78
                anchors.centerIn: parent
                border.color: "#f7f7f7ff"
                border.width: height * 0.1
                color: "transparent"
                visible: imgSelected? false : true        
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                      imgSelected = false
                      translator.setLanguage(0)
                }
            }
    }

}
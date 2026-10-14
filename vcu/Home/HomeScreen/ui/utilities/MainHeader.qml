import QtQuick 2.15
import QtQml 2.15

Item{
    id: rootAppHeaderID


    Rectangle {
        id: appHeaderID
        anchors.fill:parent
        color: "#030304"
        radius: 5

        Item {
            id: timeAreaID
            anchors.centerIn: parent
            width: parent.width * 0.4
            height: parent.height
            Image {
                id: divider1ID
                anchors.left: parent.left
                height: parent.height
                source: "qrc:/Img/StatusBar/status_divider.png"
            }
            Item {

                anchors.left: divider1ID.right
                anchors.right: divider2ID.left
                height: parent.height
                Text{
                    id: timeTextID
                    anchors.centerIn: parent
                    text: Qt.formatTime(new Date(), "hh:mm")
                    font.pixelSize: parent.height * 0.6
                    color: "#FFFFFF"
                }
            }

            Image {
                id: divider2ID
                anchors.centerIn: parent
                height: parent.height
                source: "qrc:/Img/StatusBar/status_divider.png"
            }

            Item {
                anchors.left: divider2ID.right
                anchors.right: divider3ID.left
                height: parent.height
                    Text {
                        id: dateTextID
                        anchors.centerIn: parent
                        text: Qt.formatDate(new Date(), "MMM. dd")
                        font.pixelSize: parent.height * 0.6
                        color: "#FFFFFF"
                    }
            }
            
            Image {
                id: divider3ID
                anchors.right: parent.right
                height: parent.height
                source: "qrc:/Img/StatusBar/status_divider.png"
            }
        }

    }
}
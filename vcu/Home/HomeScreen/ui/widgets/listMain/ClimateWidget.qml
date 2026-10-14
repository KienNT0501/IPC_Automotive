import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0

MouseArea {

    id: climateMouseAreaID
    anchors.fill: parent
    hoverEnabled: true
    onEnabledChanged: state = ""
        Rectangle {
            id: climateRectID
            width: parent.width 
            height: parent.height 
            opacity: 0.9
            color: "#111419"
            Image {
                id: bgClimateID
                anchors.fill: parent
                source: "qrc:/Img/Climate/bg_climate_info_01.png"
            }
        }

        
        onEntered: {
            climateMouseAreaID.state = "focus"
        }

        onPressed: {
            climateMouseAreaID.state = "pressed"
        }

        onExited: {
            climateMouseAreaID.state = "disable"
        }

        Image {
            id: bgClimateStateID
            anchors.centerIn: parent
            width: climateRectID.width * 1.04
            height: climateRectID.height * 1.04
            source: ""
        }

        states: [
            State {
                name: "focus"
                PropertyChanges {
                    target: bgClimateStateID
                    source: "qrc:/Img/HomeScreen/bg_widget_f.png"
                }
            },

            State {
                name: "pressed"
                PropertyChanges {
                    target: bgClimateStateID
                    source: "qrc:/Img/HomeScreen/bg_widget_p.png"
                }
            }

        ]

    Text {
        id: textClimateID
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height * 0.06
        text: "Climate"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }

    Text {
        id: textDriverID
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        anchors.top: parent.top
        anchors.topMargin: parent.width * 0.15
        text: "DRIVER"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }

    Text {
        id: textPassengerID
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.05
        anchors.top: parent.top
        anchors.topMargin: parent.width * 0.15
        text: "PASSENGER"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }

    Image {
        id: imgLineDriverID
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        anchors.top: textDriverID.bottom
        width: textDriverID.width
        source: "qrc:/Img/HomeScreen/widget_climate_line.png"
    }

    Image {
        id: imgLinePassengerID
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.05
        anchors.top: textPassengerID.bottom
        width: textPassengerID.width
        source: "qrc:/Img/HomeScreen/widget_climate_line.png"
    }

    Image {
        id: iconDriverID
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.15
        anchors.top: imgLineDriverID.bottom
        anchors.topMargin: parent.width * 0.04
        width: parent.width * 0.2
        height: parent.height * 0.25
        source: "qrc:/Img/HomeScreen/widget_climate_arrow_seat.png"
    }

    Image {
        id: iconPassengerID
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.05
        anchors.top: imgLinePassengerID.bottom
        anchors.topMargin: parent.width * 0.04
        width: parent.width * 0.2
        height: parent.height * 0.25
        source: "qrc:/Img/HomeScreen/widget_climate_arrow_seat.png"
    }

    Image {
        id: iconFanlevelID
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.25
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.4
        width: parent.width * 0.5
        height: parent.height * 0.2
        source: "qrc:/Img/HomeScreen/widget_climate_wind_level_bg.png"
    }

    Image {
        id: arrowHeadDriverID
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.1
        anchors.top: imgLineDriverID.bottom
        anchors.topMargin: parent.width * 0.05
        width: parent.width * 0.15
        height: parent.height * 0.12
        source:"qrc:/Img/HomeScreen/widget_climate_arrow_01_s_b.png"
    }

    Image {
        id: arrowLegriverID
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.04
        anchors.top: imgLineDriverID.bottom
        anchors.topMargin: parent.width * 0.11
        width: parent.width * 0.15
        height: parent.height * 0.12
        source:"qrc:/Img/HomeScreen/widget_climate_arrow_02_n.png"
    }

    Image {
        id: arrowHeadPassengerID
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.15
        anchors.top: imgLinePassengerID.bottom
        anchors.topMargin: parent.width * 0.05
        width: parent.width * 0.15
        height: parent.height * 0.12
        source:"qrc:/Img/HomeScreen/widget_climate_arrow_01_s_b.png"
    }

    Image {
        id: arrowLePassengerID
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.21
        anchors.top: imgLinePassengerID.bottom
        anchors.topMargin: parent.width * 0.11
        width: parent.width * 0.15
        height: parent.height * 0.12
        source:"qrc:/Img/HomeScreen/widget_climate_arrow_02_n.png"
    }

    Text {
        id: textDriverTempID
        anchors.top: imgLineDriverID.bottom
        anchors.topMargin: parent.height * 0.35
        anchors.horizontalCenter: imgLineDriverID.horizontalCenter
        text: "LOW"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }

    Text {
        id: textPassengerTempID
        anchors.top: imgLinePassengerID.bottom
        anchors.topMargin: parent.height * 0.35
        anchors.horizontalCenter: imgLinePassengerID.horizontalCenter
        text: "LOW"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }

    Image {
        id: iconFanID
        anchors.top: iconFanlevelID.bottom
        anchors.topMargin: parent.height * 0.04
        anchors.horizontalCenter: parent.horizontalCenter
        width: parent.width * 0.1
        height: parent.height * 0.12
        source: "qrc:/Img/HomeScreen/widget_climate_ico_wind.png"
    }

    Text {
        id: textOutsideID
        anchors.top: iconFanID.bottom
        anchors.topMargin: parent.height * 0.01
        anchors.horizontalCenter: parent.horizontalCenter
        text: "OUTSIDE"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.06
    }

    Text {
        id: textOutsideTempID
        anchors.top: textOutsideID.bottom
        anchors.topMargin: parent.height * 0.01
        anchors.horizontalCenter: parent.horizontalCenter
        text: "27.5°C"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }

    Text {
        id: textAutoID
        anchors.top: imgLineDriverID.bottom
        anchors.topMargin: parent.height * 0.52
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.05
        text: "AUTO"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }

    Text {
        id: textSyncID
        anchors.top: imgLineDriverID.bottom
        anchors.topMargin: parent.height * 0.52
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.05
        text: "SYNC"
        color: "#FFFFFF"
        font.pixelSize: parent.height * 0.08
    }
}
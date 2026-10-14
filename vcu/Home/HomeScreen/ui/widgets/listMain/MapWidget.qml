import QtQuick 2.15
import QtQuick.Controls 2.15
import QtLocation 5.15
import QtPositioning 5.15

MouseArea {

    id: mapMouseAreaID
    anchors.fill: parent
    hoverEnabled: true
    onEnabledChanged: state = ""

    Item {

        id: mapPresentID
        anchors.centerIn: mapMouseAreaID
        width: mapRectID.width
        height: mapRectID.height

        Plugin {
            id: mapPlugin

            name: "osm"

        }

        Map {
            id: mapView
            anchors.fill: parent
            plugin: mapPlugin
            center: QtPositioning.coordinate(
                        10.7873,
                        106.6665)
            zoomLevel: 14
            copyrightsVisible: false
            enabled: false
            Component.onCompleted: {
                mapView.addMapItem(marker)
            }
        }

        
        MapQuickItem {
            id: marker

            coordinate: QtPositioning.coordinate(
                            10.7873,
                            106.6665)

            anchorPoint.x: carIcon.width / 2
            anchorPoint.y: carIcon.height / 2

            sourceItem: Image {
                id: carIcon

                source: "qrc:/Img/Map/car_icon.png"
                width: mapRectID.width * 0.08
                height: mapRectID.height * 0.08
                fillMode: Image.PreserveAspectFit
            }
        }

    }
            Rectangle {
            id: mapRectID
            anchors {
                fill: parent
                margins: parent.width * 0.02
            }
            opacity: 0.7
            color: "transparent"
        }

        
        onEntered: {
            mapMouseAreaID.state = "focus"
        }

        onPressed: {
            mapMouseAreaID.state = "pressed"
        }

        onExited: {
            mapMouseAreaID.state = "disable"
        }

        Image {
            id: bgMapStateID
            anchors.centerIn: parent
            width: mapRectID.width * 1.04
            height: mapRectID.height * 1.04
            source: ""
        }

        states: [
            State {
                name: "focus"
                PropertyChanges {
                    target: bgMapStateID
                    source: "qrc:/Img/HomeScreen/bg_widget_f.png"
                }
            },

            State {
                name: "pressed"
                PropertyChanges {
                    target: bgMapStateID
                    source: "qrc:/Img/HomeScreen/bg_widget_p.png"
                }
            }

        ]
}
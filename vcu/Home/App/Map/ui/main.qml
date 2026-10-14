import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import QtLocation 5.15
import QtPositioning 5.15
import "AppHeader"


Item {
    id: mapWindow
    visible: true

    Image {
        id: map_bgID
        anchors.fill: parent
        source: "qrc:/Img/Media/background.png"
    }

    AppHeaderMap {
        id: appHeaderMapID
        width: parent.width
        height: parent.height * 0.1
    }

        Item {

        id: mapPresentID
        anchors.top: appHeaderMapID.bottom
        anchors.bottom: mapWindow.bottom
        width: appHeaderMapID.width
        height: mapWindow.height - appHeaderMapID.height

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
            enabled: true
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
                width: mapWindow.width * 0.05
                height: mapWindow.height * 0.05
                fillMode: Image.PreserveAspectFit
            }
        }

    }

}

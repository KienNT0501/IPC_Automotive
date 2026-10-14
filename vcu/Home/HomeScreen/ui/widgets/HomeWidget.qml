import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQml.Models 2.15
import "listMain"
import "listApp"

Item {
        id: homeWidgetID
        width: parent.width
        height: parent.height

        property string pathMediaUI: "qrc:/App/Media/ui/main.qml" 
        property string pathClimateUI: "qrc:/App/Climate/ui/main.qml" 
        property string pathMapUI: "qrc:/App/Map/ui/main.qml"
        property string pathPhoneUI: "qrc:/App/Phone/ui/main.qml"
        property string pathRadioUI: "qrc:/App/Radio/ui/main.qml"
        property string pathSettingsUI: "qrc:/App/Settings/ui/main.qml"
        property string pathVideoUI: "qrc:/App/Video/ui/main.qml"

        function openApplication(url){
            parent.push(url);
        }

        ListView {
            id: widgetLvID
            width: parent.width 
            height: parent.height * 0.5
            spacing: parent.width * 0.01
            focus: false
            orientation: ListView.Horizontal
            model: DelegateModel {
                id: delegateModelID
                model: ListModel {
                    ListElement { name: "map" }
                    ListElement { name: "climate" }
                    ListElement { name: "media" }
                }
                Keys.onPressed: {
                    console.log("pressed!")
                }
                delegate: Item {
                    width: widgetLvID.width * 0.33
                    height: widgetLvID.height
                    
                            Loader {
                            id: widgetLoaderID
                            anchors.fill: parent
                            sourceComponent: {
                                switch(model.name) {
                                    case "map":
                                        return mapWidgetID
                                    case "climate":
                                        return climateWidgetID
                                    case "media":
                                        return mediaWidgetID
                                    }
                                }
                            }
                    }
            }

            Component {
                id: mediaWidgetID

                MediaWidget {
                    id: mediaItemID
                    onClicked: {
                        openApplication(pathMediaUI)
                    }
                }
            }

            Component {
                id: climateWidgetID
                ClimateWidget {
                    id: climateItemID
                    onClicked: {
                        openApplication(pathClimateUI)
                    }
                }
            }

            Component {
                id: mapWidgetID
                MapWidget {
                    id: mapItemID
                    onClicked: {
                        openApplication(pathMapUI)
                    }
                }
            }
        }

        ListAppWidget {
            id: appLvID

            anchors {
                top: widgetLvID.bottom
                topMargin: parent.height * 0.01
                bottom: parent.bottom
                right: parent.right
                rightMargin: parent.width * 0.005
                left: parent.left
                leftMargin: parent.width * 0.005
            }
            width: parent.width
            height: parent.height * 0.5
            onAppClicked: {
                switch(app) {
                    case "Climate":
                        openApplication(pathClimateUI)
                        break
                    case "Map":
                        openApplication(pathMapUI)
                        break
                    case "Media":
                        openApplication(pathMediaUI)
                        break
                    case "Phone":
                        openApplication(pathPhoneUI)
                        break
                    case "Radio":
                        openApplication(pathRadioUI)
                        break
                    case "Settings":
                        openApplication(pathSettingsUI)
                        break
                    case "Video":
                        openApplication(pathVideoUI)
                        break                                                  
                }
            }
        }
}
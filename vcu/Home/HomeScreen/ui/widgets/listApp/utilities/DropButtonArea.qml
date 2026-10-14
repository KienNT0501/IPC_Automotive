import QtQuick 2.15
import QtQuick.Controls 2.15

Item {

    id: dropButtonAreaRootID

    property var modelIn    
    
    DropArea {
        id: dropButtonAreaID
        anchors.fill: parent
        keys: "AppButton"
        onEntered: {

        }

        onExited: {          

        }


        Item {
            id: appButtonRootID
            property int visualIndex: 0
            anchors {
                fill: parent
                horizontalCenter: parent.horizontalCenter;
                verticalCenter: parent.verticalCenter
            }

                AppButton {
                    id: appButtonID
                    anchors.fill: parent
                    icon: dropButtonAreaRootID.modelIn.iconPath
                    title: dropButtonAreaRootID.modelIn.title
                    drag.axis: Drag.XAxis

                    onItemClicked: {
                        appClicked(app)
                    }
                    
                    onItemPressed: {
                        console.log("App Pressed: " + app)

                    }

                    onItemPressAndHold: {
                        console.log("App Pressed and Hold: " + app)
                    }

                    onItemReleased: {
                        console.log("App Released: " + app)
                    }

                }
        }
    }

}
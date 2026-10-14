import QtQuick 2.15

Item{
    id: buttonBackItemID
    property string icon
    signal bButtonClicked()
    
        MouseArea {
            id: buttonBackMouseAreaID
            anchors.fill: parent
            onEnabledChanged: state = "" 
            hoverEnabled: true

            Image{
                id: buttonBackImageID
                anchors.fill: parent
                source: icon + "_d.png"
            }

            onClicked: {
                buttonBackItemID.bButtonClicked()
            }

            onPressed: {
                buttonBackMouseAreaID.state = "pressed"
                
            }
            onReleased: {
                if (containsMouse) buttonBackMouseAreaID.state = "focus"
                else buttonBackMouseAreaID.state = "disable"  
            }
            onEntered: {
                buttonBackMouseAreaID.state = "focus"
                
            }
            onExited: {
                buttonBackMouseAreaID.state = "disable"
            }
                states: [
                State {
                    name: "focus"
                    PropertyChanges {
                        target: buttonBackImageID
                        source: icon + "_f.png"
                    }
                },
                State {
                    name: "pressed"
                    PropertyChanges {
                        target: buttonBackImageID
                        source: icon + "_p.png"
                    }
                },
                State {
                    name: "disable"
                    PropertyChanges {
                        target: buttonBackImageID
                        source: icon + "_d.png"
                    }
                }
            ]
        }    
}
import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root

    property real screenWidth: 0
    property real screenHeight: 0
    //property real sldAxisY: 0
    property bool isDrawerOpened: false
    property var currPos: 0
    property var currDuration: 0
    property string pointSource: ""
    property string centerPointSource: ""

    Slider {
        id: sliderID

        width: screenWidth * 0.7
        height: screenHeight * 0.01

        anchors.right: root.right

        anchors.rightMargin: screenWidth * 0.15
        
        pressed: true
        from: 0
        to: currDuration
        stepSize: 1000
        value: currPos

        y: screenHeight * 0.75
        Behavior on anchors.rightMargin {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }

        background: Rectangle {
            id: backgroundID

            width: sliderID.width * 0.985
            height: sliderID.height

            anchors.right: sliderID.right 

            radius: height / 2
            color: "#4D4D4D"

            Rectangle {
                id: progressBarFillID

                width: sliderID.visualPosition
                       * (sliderID.width - handleID.width * 0.5)

                height: parent.height

                radius: height / 2
                color: "#b32929ff"
            }
        }

        handle: Image {
            id: handleID

            width: screenHeight * 0.05
            height: screenHeight * 0.05

            anchors.verticalCenter: parent.verticalCenter

            x: sliderID.leftPadding
               + sliderID.visualPosition
               * (sliderID.width - width )

            source: pointSource
            
            Image {
                anchors.centerIn: parent

                width: screenHeight * 0.045
                height: screenHeight * 0.045

                source: centerPointSource
            }
        }

        property real lastDraggedValue:0
        onMoved: {
                lastDraggedValue = value;

        }
        onPressedChanged: {
            if(!pressed)Player.seek(lastDraggedValue)
            console.log("Press release!")
        }
    }
}
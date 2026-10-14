import QtQuick 2.15
import QtQuick.Controls 2.15

MouseArea {
    id: appButtonMouseAreaID
    anchors.fill: parent
    hoverEnabled: true
    onEnabledChanged: state = ""
    property string icon: ""
    property string title: ""

    signal itemClicked(string app)
    signal itemPressed(string app)
    signal itemPressAndHold(string app)
    signal itemReleased(string app)

    Image {
        id: appButtonBgID
        width: parent.width
        height: parent.height * 1.15
        anchors.bottom: appButtonMouseAreaID.bottom
        anchors.bottomMargin: -parent.height * 0.15
        source: icon + "_n.png"
    }

    Text {
        id: appButtonTitleID
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.1
        text: title
        font.pixelSize: parent.height * 0.08
        color: "#FFFFFF"
    }

    onClicked: {
        itemClicked(title)
    }

    onEntered: {
        appButtonMouseAreaID.state = "focus"
    }
    onPressed: {
        appButtonMouseAreaID.state = "pressed"
        itemPressed(title)
    }
    onExited: {
        appButtonMouseAreaID.state = "disable"
    }

    onPressAndHold: {
        itemPressAndHold(title)
    }

    onReleased: {
        itemReleased(title)
    }

    states: [
        State {
            name: "focus"
            PropertyChanges {
                target: appButtonBgID
                source: icon + "_f.png"
            }
        },
        State {
            name: "pressed"
            PropertyChanges {
                target: appButtonBgID
                source: icon + "_p.png"
            }
        },
        State {
            name: "disable"
            PropertyChanges {
                target: appButtonBgID
                source: icon + "_n.png"
            }
        }
    ]
}
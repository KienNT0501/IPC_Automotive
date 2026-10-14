import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "utilities"
import "widgets"
ApplicationWindow {
    id: appWindow
    width: 1230
    height: 730
    visible: true
    title: qsTr("Home Screen")

    Image{
        id: backgroundImage
        anchors.fill: parent
        source: "qrc:/Img/bg_full.png"
    }

    MainHeader {
        id: appHeaderID
        height: parent.height * 0.1
        width: parent.width 
    }

    BButton {
            id: buttonBackID
            anchors.left: parent.left
            width: parent.width * 0.1
            height: parent.height * 0.1
            visible: (stackViewID.depth === 1) ? false : true

            icon: "qrc:/Img/StatusBar/btn_top_back"
            onBButtonClicked: {
                stackViewID.pop()
            }
    }

    StackView {
        id: stackViewID
        anchors.top: appHeaderID.bottom
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.0025
        anchors.right: parent.right
        anchors.rightMargin: parent.width * 0.0025
        anchors.bottom: parent.bottom
        initialItem: HomeWidget {
            id: homeWidgetID
            width: stackViewID.width
            height: stackViewID.height
        }
        pushEnter: Transition {
            PropertyAnimation {
                property: "x"
                from: stackViewID.width
                to: 0
                duration: 500
                easing.type: Easing.OutCubic
            }
        }
    }
}
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQml.Models 2.15
import "utilities"
Item {

    id: listAppWidgetRootID

        signal appClicked(string app)

        DelegateModel {
            id: listAppVisualItemID

                model: AppModel
                delegate: DropButtonArea {
                            id: delegateListViewID
                            width: listAppWidgetID.width * 0.16
                            height: listAppWidgetID.height
                            modelIn: model
                }
                //model: AppModel
                //delegate: Item {
                //        id: appButtonRootID
                //            width: listAppWidgetID.width * 0.16
                //            height: listAppWidgetID.height
                //        AppButton {
                //            id: appButtonID
                //            anchors.fill: parent
                //            icon: model.iconPath
                //            title: model.title
                //            onItemClicked: {
                //                appClicked(app)
                //            }
                //        }
                //    }
        }

        ListView {
            id: listAppWidgetID
            anchors {
                fill: parent
            }
            spacing: parent.width * 0.008
            orientation: ListView.Horizontal
            interactive: true
            model: listAppVisualItemID
        }
    }

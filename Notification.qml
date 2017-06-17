import QtQuick 2.0
import QtQuick.Controls 1.4
import "./Models"

Item {

    NotificationModel {
        id: notifications
        notif_type: "notifications"
    }

    NotificationModel {
        id: news
        notif_type: "news"
    }

    Rectangle {
        id: inputBar
        width: parent.width
        height: 30
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 2
        radius: 5

        TextInput {
            id:srchwrds
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            width: parent.width - cmbx.width - 20
            height: 20
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: cmbx
            visible: true
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: 100
            height: 20
        }
    }

    ListView {
        anchors.top: inputBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true

        model: notifications

        delegate: Rectangle {

        }
    }

    Component.onCompleted: notifications.load()

}

import QtQuick 2.0
import QtQuick.Controls 1.4
import "./UntappdAPI.js" as Untappd

Item {

    ListModel {
        id: checkinRecent
        // 'checkin_id'
        // 'created_at'
        // 'checkin_comment'
        // 'user_name'
        // 'first_name'
        // 'last_name'
        // 'user_avatar'
        // 'beer_id'
        // 'beer_name'
        // 'beer_label'
        // 'beer_style'
        // 'wish_list'
        // 'brewery_id'
        // 'brewery_name'
        // 'brewery_label'
        // 'country_name'
        // 'venue_id'
        // 'venue_name'
        // 'venue_icon'
        // 'photo'
    }

    ListView {
        anchors.fill: parent

        model: checkinRecent

        delegate: Rectangle {
            id: checkinView
            width: parent.width
            height: parent.width / 3

            Image {
                anchors.fill: parent
                source: photo
                Rectangle {
                    width: parent.width - 20
                    height: avatar.height + 20
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    radius: 5
                    color: "#77000000"
                    Image {
                        id: avatar
                        width: checkinView.height / 3
                        height: checkinView.height / 3
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.left: parent.left
                        anchors.leftMargin: 10
                        source: user_avatar
                    }
                    Text {
                        id: userName
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.left: avatar.right
                        anchors.leftMargin: 10
                        color: "#FFFFFF"
                        font.pixelSize: 16
                        text: user_name
                    }
                    Text {
                        anchors.top: userName.bottom
                        anchors.topMargin: 10
                        anchors.left: avatar.right
                        anchors.leftMargin: 10
                        color: "#FFFFFF"
                        font.pixelSize: 12
                        text: checkin_comment
                    }
                    Text {
                        id: createdAt
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        color: "#FFFFFF"
                        font.pixelSize: 12
                        text: Qt.formatDateTime(new Date(created_at))
                    }
                    Text {
                        anchors.top: createdAt.bottom
                        anchors.topMargin: 10
                        anchors.right: parent.right
                        anchors.rightMargin: 10
                        color: "#FFFFFF"
                        font.pixelSize: 12
                        text: venue_name ? venue_name : ''
                    }
                }
            }

            Rectangle {
                width: parent.width - 20
                height: ( parent.height / 2 ) - 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                border.width: 2
                radius: 5
                Image {
                    id: label
                    width: parent.height - 20
                    height: parent.height - 20
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    source: beer_label
                }
                Column {
                    width: parent.width - parent.height
                    height: parent.height
                    anchors.top: parent.top
                    anchors.right: parent.right
                    Text {
                        height: parent.height / 3
                        font.pixelSize: 20
                        verticalAlignment: Text.AlignVCenter
                        text: beer_name
                    }
                    Text {
                        height: parent.height / 3
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        text: brewery_name
                    }
                    Text {
                        height: parent.height / 3
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        text: beer_style
                    }
                }
            }
        }
    }

    Component.onCompleted: Untappd.getCheckinRecent(checkinRecent)
}

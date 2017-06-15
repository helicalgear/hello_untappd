import QtQuick 2.0
import QtQuick.Controls 1.4
import "./Models"

Item {

    UserCheckinsModel { id: userCheckins }

    Rectangle {
        id: inputBar
        width: parent.width
        height: 30
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 2
        radius: 5

        TextInput {
            id: userName
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            width: parent.width - viewActivity.width - 20
            height: 20
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: viewActivity
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: 100
            height: 20
            text: "View"
            onClicked: {
                userCheckins.load(userName.text)
            }
        }
    }

    ListView {
        anchors.top: inputBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true

        model: userCheckins

        delegate: Rectangle {
            id: checkinView
            width: parent.width
            height: parent.width / 3

            Image {
                anchors.fill: parent
                source: media.count > 0 ? media.items[0].photo.photo_img_md : ""
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
                        source: user.user_avatar
                    }
                    Text {
                        id: username
                        anchors.top: parent.top
                        anchors.topMargin: 10
                        anchors.left: avatar.right
                        anchors.leftMargin: 10
                        color: "#FFFFFF"
                        font.pixelSize: 16
                        text: user.user_name
                    }
                    Text {
                        anchors.top: username.bottom
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
                        text: defined(venue.venue_name) ? venue.venue_name : ''
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
                    source: beer.beer_label
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
                        text: beer.beer_name
                    }
                    Text {
                        height: parent.height / 3
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        text: brewery.brewery_name
                    }
                    Text {
                        height: parent.height / 3
                        font.pixelSize: 16
                        verticalAlignment: Text.AlignVCenter
                        text: beer.beer_style
                    }
                }
            }
        }
    }
}

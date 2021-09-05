import QtQuick 2.12

Rectangle {
    id: root
    width: parent.width
    height: parent.width / 3 + (checks.visible ? checks.height : 0)

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
                width: ( root.height - (checks.visible ? checks.height : 0) ) / 3
                height: ( root.height - (checks.visible ? checks.height : 0) ) / 3
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                source: user.user_avatar
            }

            Text {
                id: userName
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: avatar.right
                anchors.leftMargin: 10
                color: "#FFFFFF"
                font.pixelSize: 16
                text: user.user_name
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
                text: defined(venue.venue_name) ? venue.venue_name : ""
            }

        }

    }

    Rectangle {
        id: beerInfo
        width: parent.width - 20
        height: ( ( parent.height - (checks.visible ? checks.height : 0) ) / 2 ) - 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10 + (checks.visible ? checks.height : 0)
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

        MouseArea {
            anchors.fill: parent
            onClicked: checks.visible = !checks.visible
        }

    }

    Rectangle {
        id: checks
        width: parent.width - 20
        height: 100
        anchors.top: beerInfo.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 2
        radius: 5
        visible: false
    }

}

import QtQuick 2.0
import QtQuick.Controls 1.4
import "./UntappdAPI.js" as Untappd

Item {

    ListModel {
        id: checkinRecent
        // user_name
        // beer_name
        // brewry_name
    }

    ListView {
        anchors.fill: parent

        model: checkinRecent

        delegate: Rectangle {
            width: parent.width
            height: parent.width / 2

            Image {
                anchors.fill: parent
                source: media
                Image {
                    anchors.top: parent.top
                    anchors.topMargin: 10
                    anchors.left: parent.left
                    anchors.leftMargin: 10
                    source: user_avatar
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
                        font.pixelSize: 24
                        verticalAlignment: Text.AlignVCenter
                        text: beer_name
                    }
                    Text {
                        height: parent.height / 3
                        font.pixelSize: 18
                        verticalAlignment: Text.AlignVCenter
                        text: brewery_name
                    }
                    Text {
                        height: parent.height / 3
                        font.pixelSize: 18
                        verticalAlignment: Text.AlignVCenter
                        text: beer_style
                    }
                }
            }
        }
    }

    Component.onCompleted: Untappd.getCheckinRecent(checkinRecent)
}

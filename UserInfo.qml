import QtQuick 2.0
import QtQuick.Controls 1.4
import "./UntappdAPI.js" as Untappd

Item {

    property var userInfo: { "user_name": "",
                             "cover_image": "",
                             "avatar_image": "",
                             "total_checkins": "",
                             "total_beers": "",
                             "total_friends": "",
                             "total_badges": "" }

    Column {
        anchors.fill: parent

        Image {
            width: parent.width
            fillMode: Image.PreserveAspectFit
            source: userInfo.cover_image
            Column {
                anchors.centerIn: parent
                Image {
                    source: userInfo.avatar_image
                }
                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    color: "#FFFFFFFF"
                    font.pixelSize: 16
                    text: userInfo.user_name
                }
            }
        }

        Row {
            width: parent.width
            height: parent.width / 4
                Rectangle {
                    width: parent.width / 4
                    height: parent.width / 4
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 5
                            verticalAlignment: Text.AlignVCenter
                            text: "Checkins"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 4 / 5
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.total_checkins
                        }
                    }
                }
                Rectangle {
                    width: parent.width / 4
                    height: parent.width / 4
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 5
                            verticalAlignment: Text.AlignVCenter
                            text: "Original"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 4 / 5
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.total_beers
                        }
                    }
                }
                Rectangle {
                    width: parent.width / 4
                    height: parent.width / 4
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 5
                            verticalAlignment: Text.AlignVCenter
                            text: "Friends"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 4 / 5
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.total_friends
                        }
                    }
                }
                Rectangle {
                    width: parent.width / 4
                    height: parent.width / 4
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 5
                            verticalAlignment: Text.AlignVCenter
                            text: "Badges"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 4 / 5
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.total_badges
                        }
                    }
                }
        }
    }

    Component.onCompleted: Untappd.getUserInfo("");
}

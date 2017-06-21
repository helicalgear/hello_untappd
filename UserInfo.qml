import QtQuick 2.0
import QtQuick.Controls 1.4
import "./Models"

Item {

    UserInfoModel {
        id: userInfo
        user_name: settings.readData("user_name", "")
    }

    Column {
        anchors.fill: parent

        Image {
            width: parent.width
            fillMode: Image.PreserveAspectCrop
            source: userInfo.user_cover_photo
            Column {
                anchors.centerIn: parent
                Rectangle {
                    width: 128
                    height: 128
                    radius: 64
                    clip: true
                    Image {
                        anchors.fill: parent
                        clip: true
                        fillMode: Image.PreserveAspectCrop
                        source: userInfo.user_avatar
                    }
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
                    height: parent.width / 8
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 4
                            verticalAlignment: Text.AlignVCenter
                            text: "Checkins"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 3 / 4
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.stats.total_checkins
                        }
                    }
                }
                Rectangle {
                    width: parent.width / 4
                    height: parent.width / 8
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 4
                            verticalAlignment: Text.AlignVCenter
                            text: "Original"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 3 / 4
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.stats.total_beers
                        }
                    }
                }
                Rectangle {
                    width: parent.width / 4
                    height: parent.width / 8
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 4
                            verticalAlignment: Text.AlignVCenter
                            text: "Friends"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 3 / 4
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.stats.total_friends
                        }
                    }
                }
                Rectangle {
                    width: parent.width / 4
                    height: parent.width / 8
                    border.width: 2
                    radius: 5
                    Column {
                        anchors.fill: parent
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height / 4
                            verticalAlignment: Text.AlignVCenter
                            text: "Badges"
                        }
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            height: parent.height * 3 / 4
                            verticalAlignment: Text.AlignVCenter
                            font.pixelSize: parent.height * 2 / 5
                            text: userInfo.stats.total_badges
                        }
                    }
                }
        }
        Text {
            text: defined(userInfo.contact.foursquare) ? userInfo.contact.foursquare : ""
            onTextChanged: {
                if ( defined(userInfo.contact.foursquare) ^ settings.readData("foursquare", false) ) {
                    settings.saveData("foursquare", defined(userInfo.contact.foursquare))
                }
            }
        }
        Text {
            text: defined(userInfo.contact.twitter) ? userInfo.contact.twitter : ""
            onTextChanged: {
                if ( defined(userInfo.contact.twitter) ^ settings.readData("twitter", false) ) {
                    settings.saveData("twitter", defined(userInfo.contact.twitter))
                }
            }
        }
        Text {
            text: defined(userInfo.contact.facebook) ? userInfo.contact.facebook : ""
            onTextChanged: {
                if ( defined(userInfo.contact.facebook) ^ settings.readData("facebook", false) ) {
                    settings.saveData("facebook", defined(userInfo.contact.facebook))
                }
            }
        }
    }

}

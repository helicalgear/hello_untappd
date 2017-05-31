import QtQuick 2.0
import QtQuick.Controls 1.4
import "./UntappdAPI.js" as Untappd

Item {

    property var userInfo: { "user_name": "",
                             "cover_image": "",
                             "avatar_image": ""}

    Image {
        anchors.fill: parent
        source: userInfo.cover_image
        Column {
            anchors.centerIn: parent
            Image {
                source: userInfo.avatar_image
            }
            Text {
                text: userInfo.user_name
            }
        }
    }

    Component.onCompleted: Untappd.getUserInfo("");
}

import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

AbstractInfoModel {
    endpoint: "user/info/%1".arg(user_name)
    target: "user"

    property string user_name: ""
    property string user_cover_photo: ""
    property string user_avatar: ""
    property var stats: { "total_checkins": "",
                          "total_beers": "",
                          "total_friends": "",
                          "total_badges": "" }
    property var contact: { "foursquare": "",
                            "twitter": "",
                            "facebook": "" }

    onInfoChanged: {
        user_name = info.user_name;
        user_cover_photo = info.user_cover_photo;
        user_avatar = info.user_avatar;
        stats = info.stats;
        contact = info.contact;
    }
}

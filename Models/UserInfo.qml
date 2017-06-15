import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

Item {
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

    function load() {
        Untappd.getUserInfo(function(user_info) {
            user_name = user_info.user_name;
            user_cover_photo = user_info.user_cover_photo;
            user_avatar = user_info.user_avatar;
            stats = user_info.stats;
            contact = user_info.contact
        }, user_name)
    }
}

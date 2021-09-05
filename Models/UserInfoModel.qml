import QtQuick 2.12
import "../Utils/UntappdAPI.js" as Untappd

AbstractInfoModel {
    endpoint: "user/info/%1".arg(user_name)
    target: "user"

    property string user_name
    property string user_cover_photo: info ? info.user_cover_photo : ""
    property string user_avatar: info ? info.user_avatar : ""
    property var stats: info ? info.stats : { "total_checkins": "",
                                              "total_beers": "",
                                              "total_friends": "",
                                              "total_badges": "" }
    property var contact: info ? info.contact : { "foursquare": "",
                                                  "twitter": "",
                                                  "facebook": "" }

    onEndpointChanged: if ( user_name !=="" ) load()

}

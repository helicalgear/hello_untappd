import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

AbstractInfoModel {
    endpoint: "beer/info/%1".arg(bid)
    target: "beer"

    property string bid
    property string beer_name: info ? info.beer_name : ""
    property string beer_label: info ? info.beer_label : ""
    property string beer_abv: info ? info.beer_abv : ""
    property string beer_ibu: info ? info.beer_ibu : ""
    property string beer_description: info ? info.beer_description : ""
    property string beer_style: info ? info.beer_style : ""
    property string rating_count: info ? info.rating_count : ""
    property string rating_score: info ? info.rating_score : ""
    property var stats: info ? info.stats : { "total_count": "",
                                              "monthly_count": "",
                                              "total_user_count": "",
                                              "user_count": "" }
    property var brewery: info ? info.brewery : { "brewery_id": "",
                                                  "brewery_name": "",
                                                  "brewery_label": "",
                                                  "country_name": "" }
    property string auth_rating: info ? info.auth_rating : ""
    property string wish_list: info ? info.wish_list : ""

    onEndpointChanged: if (bid !== "") load()

}

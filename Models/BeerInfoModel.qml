import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

AbstractInfoModel {
    endpoint: "beer/info/%1".arg(bid)
    target: "beer"

    property string bid: ""
    property string beer_name: ""
    property string beer_label: ""
    property string beer_abv: ""
    property string beer_ibu: ""
    property string beer_description: ""
    property string beer_style: ""
    property string rating_count: ""
    property string rating_score: ""
    property var stats: { "total_count": "",
                          "monthly_count": "",
                          "total_user_count": "",
                          "user_count": "" }
    property var brewery: { "brewery_id": "",
                            "brewery_name": "",
                            "brewery_label": "",
                            "country_name": "" }
    property string auth_rating: ""
    property string wish_list: ""

    onInfoChanged: {
        bid = info.bid;
        beer_name = info.beer_name;
        beer_label = info.beer_label;
        beer_abv = info.beer_abv;
        beer_ibu = info.beer_ibu;
        beer_description = info.beer_description;
        beer_style = info.beer_style;
        rating_count = info.rating_count;
        rating_score = info.rating_score;
        stats = info.stats;
        brewery = info.brewery;
        auth_rating = info.auth_rating;
        wish_list = info.wish_list;
    }

}

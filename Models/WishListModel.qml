import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

AbstractSearchModel {
    endpoint: "user/wishlist/%1".arg(user_name)
    parameters: ""
    target: "beers"
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of results to return, max of 50, default is 25
    property string sort: "date"    // (optional) - You can sort the results using these values:
                                    //              date - sorts by date (default),
                                    //              checkin - sorted by highest checkin,
                                    //              highest_rated - sorts by global rating descending order,
                                    //              lowest_rated - sorts by global rating ascending order,
                                    //              highest_abv - highest ABV from the wishlist,
                                    //              lowest_abv - lowest ABV from the wishlist
    property string user_name: ""

}

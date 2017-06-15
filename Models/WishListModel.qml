import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    property int offset: 0          // (optional) - The numeric offset that you what results to start
    property int limit: 0           // (optional) - The number of results to return, max of 50, default is 25
    property string sort: "date"    // (optional) - You can sort the results using these values:
                                    //              date - sorts by date (default),
                                    //              checkin - sorted by highest checkin,
                                    //              highest_rated - sorts by global rating descending order,
                                    //              lowest_rated - sorts by global rating ascending order,
                                    //              highest_abv - highest ABV from the wishlist,
                                    //              lowest_abv - lowest ABV from the wishlist

    function load() {
        Untappd.getUserWishlist(function(count, items) {
            clear();
            for (var n=0; n<count; n++) {
                append(items[n]);
            }
        });
    }
}

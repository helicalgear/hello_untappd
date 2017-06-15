import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    property int offset: 0          // (optional) - The numeric offset that you what results to start
    property int limit: 25          // (optional) - The number of results to return, max of 50, default is 25
    property string sort: "checkin" // (optional) - Your can sort the results using these values:
                                    //              checkin - sorts by checkin count (default),
                                    //              name - sorted by alphabetic beer name

    function load(query) {
        Untappd.getSearchBeer(function(count, items) {
            clear();
            for (var n=0; n<count; n++) {
                append(items[n]);
            }
        }, query);
    }
}

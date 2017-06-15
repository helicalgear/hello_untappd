import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    property int offset: 0  // (optional) - The numeric offset that you what results to start
    property int limit: 25  // (optional) - The number of results to return, max of 50, default is 25

    function load(query) {
        Untappd.getSearchBrewery(function(count, items) {
            clear();
            for (var n=0; n<count; n++) {
                append(items[n]);
            }
        }, query);
    }
}

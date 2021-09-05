import QtQuick 2.12
import "../Utils/UntappdAPI.js" as Untappd

AbstractSearchModel {
    endpoint: "search/brewery"
    parameters: "q=%1&".arg(q)
    target: "brewery"
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of results to return, max of 50, default is 25

    function load(query) {
        Untappd.getSearchBrewery(function(count, items) {
            clear();
            for (var n=0; n<count; n++) {
                append(items[n]);
            }
        }, query);
    }
}

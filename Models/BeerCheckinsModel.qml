import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    property int max_id: 0  // (optional) - The checkin ID that you want the results to start with
    property int min_id: 0  // (optional) - Returns only checkins that are newer than this value
    property int limit: 25  // (int, optional) - The number of results to return, max of 25, default is 25

    function load(bid) {
        Untappd.getBeerCheckins(function(count, items) {
            clear();
            for (var n=0; n<count; n++) {
                append(items[n]);
            }
        }, bid);
    }
}

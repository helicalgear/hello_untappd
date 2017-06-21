import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ThepubLocalModel {

    function load() {
        loading = true;
        clear();
        Untappd.accessAPI( function(resp, jsn) {
            if ( resp ) {
                var venue_list = [];
                var items = jsn.checkins.items;
                for (var n=0; n<jsn.checkins.count; n++) {
                    max_id = items[n].checkin_id;
                    if (Object.keys(items[n].venue).length === 0) { items[n].venue = {}; }
                    if (venue_list.indexOf(items[n].venue.venue_id) === -1) {
                        venue_list.push(items[n].venue.venue_id);
                        append(items[n].venue);
                    }
                }
            } else {
                console.log ("%1: %2".arg(jsn.code).arg(jsn.error_detail));
            }
            loading = false;
        }, "GET", endpoint, parameters);
    }

    function reload() {
        loading = true;
        Untappd.accessAPI( function(resp, jsn) {
            if ( resp ) {
                var venue_list = [];
                var items = jsn.checkins.items;
                for (var n=0; n<jsn.checkins.count; n++) {
                    max_id = items[n].checkin_id;
                    if (Object.keys(items[n].venue).length === 0) { items[n].venue = {}; }
                    if (venue_list.indexOf(items[n].venue.venue_id) === -1) {
                        venue_list.push(items[n].venue.venue_id);
                        append(items[n].venue);
                    }
                }
            } else {
                console.log ("%1: %2".arg(jsn.code).arg(jsn.error_detail));
            }
            loading = false;
        }, "GET", endpoint, "%1&max_id=%2".arg(parameters).arg(max_id));
    }
}

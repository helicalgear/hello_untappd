import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    //
    property bool loading: false
    property string endpoint: ""
    property string parameters: ""
    //
    property int max_id: 0
    property int min_id: 0
    property int limit: 25

    function load() {
        loading = true;
        clear();
        Untappd.accessAPI( function(result, response, notifications) {
            if ( result ) {
                var items = response.checkins.items;
                for (var n = 0; n < response.checkins.count; n++) {
                    if (Object.keys(items[n].venue).length === 0) { items[n].venue = {}; }
                    append(items[n]);
                }
            } else {
                console.log ("%1: %2".arg(response.code).arg(response.error_detail));
            }
            loading = false;
        }, "GET", endpoint, parameters);
    }
}

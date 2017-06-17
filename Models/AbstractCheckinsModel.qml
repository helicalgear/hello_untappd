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
        Untappd.accessAPI( function(jsn) {
            var items = jsn.checkins.items;
            for (var n=0; n<jsn.checkins.count; n++) {
                if (Object.keys(items[n].venue).length === 0) { items[n].venue = {}; }
                append(items[n]);
            }
            loading = false;
        }, "GET", endpoint, parameters)
    }
}

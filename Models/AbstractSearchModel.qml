import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    //
    property bool loading: false
    property string endpoint: ""
    property string parameters: ""
    property string target: ""
    //
    property string q: ""
    property int offset: 0
    property int limit: 25

    function search() {
        loading = true;
        clear();
        Untappd.accessAPI( function(jsn) {
            var items = jsn[target].items;
            for (var n=0; n<jsn[target].count; n++) {
                append(items[n]);
            }
            loading = false;
        }, "GET", endpoint, parameters)
    }
}

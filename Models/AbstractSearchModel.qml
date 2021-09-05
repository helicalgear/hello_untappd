import QtQuick 2.12
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
        Untappd.accessAPI( function(result, response, notifications) {
            if ( result ) {
                var items = response[target].items;
                for (var n=0; n<response[target].count; n++) {
                    append(items[n]);
                }
            } else {
                console.log("%1: %2".arg(response.code).arg(response.error_detail));
            }
            loading = false;
        }, "GET", endpoint, parameters);
    }
}

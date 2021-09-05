import QtQuick 2.12
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    property int offset: 0                      // (optional) - The numeric offset that you what results to start
    property int limit: 0                       // (optional) - The number of results to return, max of 50, default is 25
    property string notif_type: "notification"  // [original] notifications - notification list
                                                //            news - news list

    function load() {
        Untappd.getNotifications(function(count, items) {
            clear();
            for (var n=0; n<count; n++) {
                append(items[n]);
            }
        }, notif_type);
    }
}

import QtQuick 2.0
import "../Utils/FoursquareAPI.js" as Foursquare

ThepubLocalModel {
    endpoint: "venues/search"
    parameters: "ll=%1,%2&radius=%3&query=%4".arg(lat).arg(lng).arg(radius).arg(query)
    property string query: ""

    function load() {
        loading = true;
        clear();
        Foursquare.accessAPI( function(result, response, notifications) {
            if ( result ) {
                var items = response.venues;
                var count = Object.keys(response.venues).length;
                for (var n=0; n<count; n++) {
                    append(items[n]);
                }
            } else {
                console.log ("%1: %2".arg(response.code).arg(response.error_detail));
            }
            loading = false;
        }, "GET", endpoint, parameters);
    }

}

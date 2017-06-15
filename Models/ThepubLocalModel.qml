import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

ListModel {
    property int max_id: 0              // (optional) - The checkin ID that you want the results to start with
    property int min_id: 0              // (optional) - Returns only checkins that are newer than this value
    property int limit: 25              // (optional) - The number of results to return, max of 25, default is 25
    property int radius: 25             // (optional) - The max radius you would like the check-ins to start within, max of 25, default is 25
    property string dist_pref: distPref // (optional) - If you want the results returned in miles or km. Available options: "m", or "km". Default is "m"

    function load(lat, lng) {
        Untappd.getThepubLocal(function(count, items) {
            clear();
            for (var n=0; n<count; n++) {
                append(items[n]);
            }
        }, { "lat": lat, "lng": lng, "radius": radius, "dist_pref": dist_pref });
    }
}

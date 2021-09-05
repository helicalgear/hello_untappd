import QtQuick 2.12

AbstractCheckinsModel {
    endpoint: "thepub/local"
    parameters: "lat=%1&lng=%2&radius=%3&dist_pref=%4&".arg(lat).arg(lng).arg(radius).arg(dist_pref)
    // max_id (int, optional) - The checkin ID that you want the results to start with
    // min_id (int, optional) - Returns only checkins that are newer than this value
    // limit (int, optional) - The number of results to return, max of 25, default is 25
    property real lat: 0.0
    property real lng: 0.0
    property int radius: 25             // (optional) - The max radius you would like the check-ins to start within, max of 25, default is 25
    property string dist_pref: distPref // (optional) - If you want the results returned in miles or km. Available options: "m", or "km". Default is "m"

}

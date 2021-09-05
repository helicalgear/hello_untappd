import QtQuick 2.12
import "../Utils/UntappdAPI.js" as Untappd

AbstractCheckinsModel {
    endpoint: "venue/checkins/%1".arg(venue_id)
    // max_id (int, optional) - The checkin ID that you want the results to start with
    // min_id (int, optional) - Returns only checkins that are newer than this value
    // limit (int, optional) - The number of results to return, max of 25, default is 25
    property string venue_id: ""

    onEndpointChanged: if ( venue_id !== "" ) load();

}

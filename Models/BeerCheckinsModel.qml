import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

AbstractCheckinsModel {
    endpoint: "beer/checkins/%1".arg(bid)
    // max_id (int, optional) - The checkin ID that you want the results to start with
    // min_id (int, optional) - Returns only checkins that are newer than this value
    // limit (int, optional) - The number of results to return, max of 25, default is 25
    property string bid: ""

    onEndpointChanged: if ( bid !== "" ) load()

}

import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

AbstractCheckinsModel {
    endpoint: "checkin/recent"
    // max_id (int, optional) - The checkin ID that you want the results to start with
    // min_id (int, optional) - Returns only checkins that are newer than this value
    // limit (int, optional) - The number of results to return, max of 50, default is 25

}

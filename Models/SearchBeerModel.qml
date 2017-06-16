import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

AbstractSearchModel {
    endpoint: "search/beer"
    parameters: "q=%1&".arg(q)
    target: "beers"
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of results to return, max of 50, default is 25
    property string sort: "checkin" // (optional) - Your can sort the results using these values:
                                    //              checkin - sorts by checkin count (default),
                                    //              name - sorted by alphabetic beer name

}

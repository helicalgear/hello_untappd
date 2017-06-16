import QtQuick 2.0
import "../Utils/UntappdAPI.js" as Untappd

Item {
    //
    property bool loading: false
    property bool complete: false
    property string endpoint: ""
    property string parameters: compact ? "compact=true&" : ""
    property string target: ""
    property var info
    //
    property bool compact: false

    function load() {
        loading = true;
        Untappd.accessAPI( function(jsn) {
            info = jsn[target];
            loading = false;
            complete = true;
        }, "GET", endpoint, parameters)
    }

}

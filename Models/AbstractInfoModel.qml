import QtQuick 2.12
import "../Utils/UntappdAPI.js" as Untappd

QtObject {
    //
    property bool loading: false
    property string endpoint: ""
    property string parameters: compact ? "compact=true&" : ""
    property string target: ""
    property var info
    //
    property bool compact: false

    function load() {
        loading = true;
        Untappd.accessAPI( function(result, response, notifications) {
            if ( result ) {
                info = response[target];
            } else {
                console.log("%1: %2".arg(response.code).arg(response.error_detail));
            }
            loading = false;
        }, "GET", endpoint, parameters);
    }
}

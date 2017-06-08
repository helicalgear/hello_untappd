import QtQuick 2.7
import QtQuick.Controls 1.4
import QtPositioning 5.3
import "./UntappdAPI.js" as Untappd

ApplicationWindow {
    id: root
    width: 480
    height: 360

    property var thePubParam: { "lat": 0.0,
                                "lng": 0.0,
                                "radius": "25",
                                "dist_pref": "m" }

    ListModel {
        id: thepubLocal
    }

    PositionSource {
        id: posSource
        updateInterval: 30000
        active: true
        onPositionChanged: {
            thePubParam.lat = posSource.position.coordinate.latitude;
            thePubParam.lng = posSource.position.coordinate.longitude;
            thepubLocal.clear();
            if (thePubParam.latitude !== "0.0") {
                Untappd.getThepubLocal(thePubParam);
            }
        }
    }

    ListView {
        anchors.fill: parent

        model: thepubLocal

        delegate: Rectangle {
            width: parent.width
            height: 100

            Column {
                Text {
                    text: venue_name
                }
                Text {
                    text: location
                }
            }
        }
    }

}

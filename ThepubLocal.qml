import QtQuick 2.0
import QtQuick.Controls 1.4
import "./UntappdAPI.js" as Untappd

Item {

    property var thePub: { "lat": 35.705252,
                           "lng": 139.6637752,
                           "radius": 1 }

    ListModel {
        id: thepubLocal
    }

    ListView {
        anchors.fill: parent

        model: thepubLocal

        delegate: Text {
            text: "%1: %2".arg(venue.venue_id).arg(venue.venue_name)
        }
    }

    Component.onCompleted: Untappd.getThepubLocal(thePub)
}

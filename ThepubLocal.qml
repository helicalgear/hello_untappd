import QtQuick 2.0
import QtQuick.Controls 1.4
import "./Models"

Item {

    property var thePub: { "lat": 35.705252,
                           "lng": 139.6637752,
                           "radius": 1 }

    ThepubLocalModel {
        id: thepubLocal
    }

    ListView {
        anchors.fill: parent

        model: thepubLocal

        delegate: Text {
            text: "%1: %2".arg(venue.venue_id).arg(venue.venue_name)
        }
    }

    Component.onCompleted: thepubLocal.load(thePub.lat, thePub.lng)
}

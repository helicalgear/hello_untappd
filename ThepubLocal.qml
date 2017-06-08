import QtQuick 2.0
import QtQuick.Controls 1.4
import "./UntappdAPI.js" as Untappd

Item {

    property var thePub: { "lat": 35.6894072,
                           "lng": 139.6981171 }

    ListModel {
        id: thepubLocal
    }

    ListView {
        anchors.fill: parent

        model: thepubLocal

        delegate: Text {
            text: venue.venue_name
        }
    }

    Component.onCompleted: Untappd.getThepubLocal(thePub)
}

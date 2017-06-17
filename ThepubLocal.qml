import QtQuick 2.0
import QtQuick.Controls 1.4
import "./Models"

Item {

    property var thePub: { "lat": 35.705252,
                           "lng": 139.6637752,
                           "radius": 5 }

    ThepubLocalModel {
        id: thepubLocal
    }

    ListView {
        anchors.fill: parent

        model: thepubLocal

        delegate: Rectangle {
            width: parent.width
            height: 64
            Row {
                anchors.fill: parent
                Image {
                    width: parent.height
                    height: parent.height
                    source: venue.venue_label ? venue.venue_label : ""
                }
                Text {
                    text: "%1: %2".arg(venue.venue_id).arg(venue.venue_name)
                }
            }

        }
    }

    Component.onCompleted: {
        thepubLocal.lat = thePub.lat
        thepubLocal.lng = thePub.lng
        thepubLocal.radius = thePub.radius
        thepubLocal.load()
    }
}

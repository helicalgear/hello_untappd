import QtQuick 2.12
import QtQuick.Controls 1.4
import "./Models"
import "./Delegates"

Item {

    property var thePub: { "lat": 35.705252,
                           "lng": 139.6637752,
                           "radius": 5 }

    ThepubLocalModel { id: thepubLocal }

    ListView {
        id: root

        anchors.fill: parent

        model: thepubLocal

        delegate: CheckinItem {
            id: checkinItem
        }

    }

    Component.onCompleted: {
        thepubLocal.lat = thePub.lat
        thepubLocal.lng = thePub.lng
        thepubLocal.radius = thePub.radius
        thepubLocal.load()
    }

}

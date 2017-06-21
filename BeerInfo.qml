import QtQuick 2.7
import QtQuick.Controls 1.4
import QtPositioning 5.3
import "./Models"
import "./Utils/UntappdAPI.js" as Untappd

ApplicationWindow {
    id: root
    width: 480
    height: 360

    property string beerId

    BeerInfoModel {
        id: beerInfo
        bid: beerId
    }

    VenueListModel {
        id: thepubLocal
    }

    property var checkInParam: { "bid": beerId,
                                 "foursquare_id": "",
                                 "geolat": 0,
                                 "geolng": 0,
                                 "shout": "",
                                 "rating": beerInfo.auth_rating,
                                 "facebook": "off",
                                 "twitter": "off",
                                 "foursqare": "off" }

    PositionSource {
        id: posSource
        updateInterval: 30000
        active: true
        preferredPositioningMethods: PositionSource.NonSatellitePositioningMethods

        onPositionChanged: {
            var radius = Math.ceil(posSource.position.horizontalAccuracy / 1000)
            if (radius <= 0 || radius >= 25) { radius = 25 }
            thepubLocal.lat = posSource.position.coordinate.latitude
            thepubLocal.lng = posSource.position.coordinate.longitude
            thepubLocal.radius = 25 // radius
            thepubLocal.load()
        }
    }

    Column {
        anchors.fill: parent
        Rectangle {
            width: parent.width
            height: parent.width / 5
            border.width: 2
            radius: 10
            Image {
                id: label
                width: parent.height - 20
                height: parent.height - 20
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                source: beerInfo.beer_label
            }
            Column {
                width: parent.width - parent.height
                height: parent.height
                anchors.top: parent.top
                anchors.right: parent.right
                Text {
                    height: parent.height / 3
                    font.pixelSize: 24
                    verticalAlignment: Text.AlignVCenter
                    text: beerInfo.beer_name
                }
                Text {
                    height: parent.height / 3
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    text: beerInfo.brewery.brewery_name
                }
                Text {
                    height: parent.height / 3
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    text: beerInfo.beer_style
                }
            }
        }

        Row {
            width: parent.width
            Rectangle {
                width: parent.width * 0.25
                height: width * 0.4
                border.width: 1
                radius: 10
                Column {
                    anchors.fill: parent
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "TOTAL"
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 18
                        text: beerInfo.stats.total_count
                    }
                }
            }
            Rectangle {
                width: parent.width * 0.25
                height: width * 0.4
                border.width: 1
                radius: 10
                Column {
                    anchors.fill: parent
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "UNIQUE"
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 18
                        text: beerInfo.stats.total_user_count
                    }
                }
            }
            Rectangle {
                width: parent.width * 0.25
                height: width * 0.4
                border.width: 1
                radius: 10
                Column {
                    anchors.fill: parent
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "MONTHLY"
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 18
                        text: beerInfo.stats.monthly_count
                    }
                }
            }
            Rectangle {
                width: parent.width * 0.25
                height: width * 0.4
                border.width: 1
                radius: 10
                Column {
                    anchors.fill: parent
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "YOU"
                    }
                    Text {
                        anchors.horizontalCenter: parent.horizontalCenter
                        font.pixelSize: 18
                        text: beerInfo.stats.user_count
                    }
                }
            }
        }

        Row {
            width: parent.width
            Slider {
                width: parent.width * 0.8
                id: rating
                maximumValue: 5.0
                stepSize: 0.25
                value: defined(beerInfo.auth_rating) ? beerInfo.auth_rating : 0.0
                onValueChanged: checkInParam.rating = value
            }
            Text {
                width: parent.width * 0.2
                text: rating.value
            }
        }

        Row {
            width: parent.width
            spacing: 10
            Button {
                text: "Twitter"
                enabled: settings.readData("twitter", false)
                onClicked: {
                    switch (checkInParam.twitter) {
                    case "on":
                        checkInParam.twitter = "off";
                        break;
                    case "off":
                        checkInParam.twitter = "on";
                        break;
                    default:
                        break;
                    }
                }
            }
            Button {
                text: "Facebook"
                enabled: settings.readData("facebook", false)
                onClicked: {
                    switch (checkInParam.facebook) {
                    case "on":
                        checkInParam.facebook = "off";
                        break;
                    case "off":
                        checkInParam.facebook = "on";
                        break;
                    default:
                        break;
                    }
                }
            }
            Button {
                id: foursquare
                text: "Foursquare"
                enabled: settings.readData("foursquare", false) && checkInParam.foursquare_id !== ""
                onClicked: {
                    switch (checkInParam.foursquare) {
                    case "on":
                        checkInParam.foursquare = "off";
                        break;
                    case "off":
                        checkInParam.foursquare = "on";
                        break;
                    default:
                        break;
                    }
                }
            }
            Button {
                text: "Checin In!"
                onClicked: Untappd.postCheckinAdd(checkInParam)
            }
            Button {
                id: venue
                text: "Not Selected"
                onClicked: {
                    venue.text = "Not Selected"
                    checkInParam.foursquare_id = "";
                    checkInParam.geolat = 0.0;
                    checkInParam.geolng = 0.0;
                    checkInParam.foursquare = "off";
                }
            }
        }

        ListView {
            width: parent.width
            height: width * 0.25
            model: thepubLocal
            delegate: Text {
                text: venue_name
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        venue.text = parent.text;
                        checkInParam.foursquare_id = foursquare.foursquare_id;
                        checkInParam.geolat = location.lat;
                        checkInParam.geolng = location.lng;
                        checkInParam.foursquare = "on";
                    }
                }
            }
        }

    }

}

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

    ThepubLocalModel {
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
        updateInterval: 10000
        active: true
//        preferredPositioningMethods: PositionSource.NonSatellitePositioningMethods

        onPositionChanged: {
            var radius = Math.round(posSource.position.horizontalAccuracy / 1000)
            if (radius <= 0 || radius >= 25) { radius = 25 }
            thepubLocal.lat = posSource.position.coordinate.latitude
            thepubLocal.lng = posSource.position.coordinate.longitude
            thepubLocal.radius = radius
            thepubLocal.load()
            console.log(thepubLocal.lat)
            console.log(thepubLocal.lng)
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
                enabled: settings.readData("twitter", "") !== ""
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
                enabled: settings.readData("facebook", "") !== ""
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
                text: "Foursquare"
                enabled: settings.readData("foursquare", "") !== "" && checkInParam.foursquare_id !== ""
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
                text: "Checin In!"
                onClicked: Untappd.postCheckinAdd(checkInParam)
            }
        }

        ListView {
            width: parent.width
            height: width * 0.25
            model: thepubLocal
            delegate: Text {
                text: thepubLocal.venue.venue_name
            }
        }

    }

}

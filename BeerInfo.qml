import QtQuick 2.7
import QtQuick.Controls 1.4
import QtPositioning 5.3
import "./UntappdAPI.js" as Untappd

ApplicationWindow {
    id: root
    width: 480
    height: 360

    property string beerId
    property var beerInfo: {
        "beer_name": "",
        "beer_label": "",
        "beer_abv": "",
        "beer_ibu": "",
        "beer_description": "",
        "beer_style": "",
        "brewery_name": "",
        "brewery_label": ""
    }
    property var checkInParam: { "bid": beerId,
                                 "offset": "+9",
                                 "timezone": "JST",
                                 "foursquare_id": "",
                                 "geolat": null,
                                 "geolng": null,
                                 "shout": "",
                                 "rating": 0,
                                 "facebook": "off",
                                 "twitter": "off",
                                 "foursqare": "off"
    }

    PositionSource {
        id: posSource
        updateInterval: 30000
        active: false
        onPositionChanged: {
            if (posSource.active) {
                checkInParam.geolat = posSource.position.coordinate.latitude;
                checkInParam.geolng = posSource.position.coordinate.longitude;
            } else {
                checkInParam.geolat = null;
                checkInParam.geolng = null;
            }
        }
    }

    Column {
        anchors.centerIn: parent
        Image {
            source: beerInfo.beer_label
        }
        Text {
            text: beerInfo.beer_name
        }

        Button {
            text: "Position"
            onClicked: posSource.active = !posSource.active
        }
        Button {
            text: "Twitter"
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
        Row {
            Slider {
                id: rating
                maximumValue: 5.0
                stepSize: 0.25
                value: 2.5
            }
            Text {
                text: rating.value
            }
        }
        Button {
            text: "Checin In!"
            onClicked: Untappd.postCheckinAdd(checkInParam)
        }
    }

    onBeerIdChanged: {
        if (beerId !== "") { Untappd.getBeerInfo(beerId); }
    }
}

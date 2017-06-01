import QtQuick 2.7
import QtQuick.Controls 1.4
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

    Column {
        anchors.centerIn: parent
        Image {
            source: beerInfo.beer_label
        }
        Text {
            text: beerInfo.beer_name
        }
        Button {
            text: "Checin In!"
            onClicked: Untappd.postCheckinAdd({"bid": beerId, "offset": "+9", "timezone": "JST"})
        }
    }

    onBeerIdChanged: {
        if (beerId !== "") { Untappd.getBeerInfo(beerId); }
    }
}

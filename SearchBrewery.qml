import QtQuick 2.12
import QtQuick.Controls 1.4
import "./Models"

Item {

    SearchBreweryModel { id: searchBrewery }

    Rectangle {
        id: inputBar
        width: parent.width
        height: 30
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        border.width: 2
        radius: 5

        TextInput {
            id:srchwrds
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.left: parent.left
            anchors.leftMargin: 5
            width: parent.width - srchbtn.width - 20
            height: 20
            verticalAlignment: Text.AlignVCenter
        }

        Button {
            id: srchbtn
            anchors.top: parent.top
            anchors.topMargin: 5
            anchors.right: parent.right
            anchors.rightMargin: 5
            width: 100
            height: 20
            text: "Search!"
            onClicked: {
                searchBrewery.q = srchwrds.text
                searchBrewery.search();
            }
        }
    }

    ListView {
        anchors.top: inputBar.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        clip: true

        model: searchBrewery

        delegate: Rectangle {
            width: parent.width
            height: parent.width / 5
            border.width: 2
            radius: 5
            Image {
                id: label
                width: parent.height - 20
                height: parent.height - 20
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.left: parent.left
                anchors.leftMargin: 10
                source: brewery.brewery_label
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
                    text: brewery.brewery_name
                }
                Text {
                    height: parent.height / 3
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    text: brewery.country_name
                }
                Text {
                    height: parent.height / 3
                    font.pixelSize: 18
                    verticalAlignment: Text.AlignVCenter
                    text: brewery.beer_count
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var component = Qt.createComponent("BeerInfo.qml");
                    var newWin = component.createObject();
                    newWin.beerId = beer.bid;
                    newWin.show();
                }
            }

        }
    }
}

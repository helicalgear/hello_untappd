import QtQuick 2.7
import QtQuick.Controls 1.4
import "./Utils/UntappdAPI.js" as Untappd

ApplicationWindow {
    id: root
    visible: true
    width: 480
    height: 640
    title: qsTr("Hello Untappd")

    // Authentication
    Timer {
        running: settings.readData('AccessToken', "") === ""
        interval: 100
        onTriggered: {
            var component = Qt.createComponent("Auth.qml");
            var authWin = component.createObject();
            authWin.show();
            authWin.codeChanged.connect(function() {
                Untappd.getAccessToken(authWin.code);
            })
            mainView.update();
        }
    }

    // Common Components
    SettingsStorage {
        id: settings
        identifier: 'Untappd'
        description: 'https://helicalgear.blogspot.jp/'
    }

    //　Common Functions
    function defined(obj) { return typeof obj !== 'undefined' }

    // Main Window Components
    TabView {
        id: mainView
        anchors.fill: parent
        Tab { title: "Search Beer" ; SearchBeer {} }
        Tab { title: "Search Brewery" ; SearchBrewery {} }
        Tab { title: "User Info" ; UserInfo {} }
        Tab { title: "Activity Feed" ; Activity {} }
        Tab { title: "User Activity Feed" ; UserActivity {} }
        Tab { title: "The Pub"; ThepubLocal {} }
    }

}

import QtQuick 2.7
import QtQuick.Controls 1.4

ApplicationWindow {
    id: root
    visible: true
    width: 480
    height: 640
    title: qsTr("Hello Untappd")

    // Common Component
    SettingsStorage {
        id: settings
        identifier: 'Untappd'
        description: 'https://helicalgear.blogspot.jp/'
    }

    //　Common Functions
    function defined(obj) { return typeof obj !== 'undefined'}

    // Main Window Component
    TabView {
        id: mainView
        anchors.fill: parent
//        Tab { title: "Authorization" ; Authorization {} }
        Tab { title: "Search Beer" ; SearchBeer {} }
        Tab { title: "User Info" ; UserInfo {} }
        Tab { title: "Activity Feed" ; Activity {} }
        Tab { title: "User Activity Feed" ; UserActivity {} }
        Tab { title: "The Pub"; ThepubLocal {} }
    }

}

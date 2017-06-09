import QtQuick 2.7
import QtQuick.Controls 1.4

ApplicationWindow {
    id: root
    visible: true
    width: 480
    height: 640
    title: qsTr("Hello Untappd")

    function defined(obj) { return typeof obj !== 'undefined'}

    SettingsStorage {
        id: settings
        identifier: 'Untappd'
        description: 'https://helicalgear.blogspot.jp/'
    }

    TabView {
        id: mainView
        anchors.fill: parent
        Tab { title: "Authorization" ; Authorization {} }
        Tab { title: "User Info" ; UserInfo {} }
        Tab { title: "Activity Feed" ; Activity {} }
        Tab { title: "User Activity Feed" ; UserActivity {} }
        Tab { title: "Search Beer" ; SearchBeer {} }
        Tab { title: "The Pub"; Notification {} }
    }

}

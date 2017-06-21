import QtQuick 2.0
import QtQuick.Controls 1.4
import "./Models"
import "./Delegates"

Item {

    CheckinRecentModel { id: checkinRecent }

    ListView {
        anchors.fill: parent

        model: checkinRecent

        delegate: CheckinItem {
            id: checkinItem
        }
    }
}

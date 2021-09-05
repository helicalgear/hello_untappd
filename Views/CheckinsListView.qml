import QtQuick 2.12
import "../Utils/UntappdAPI.js" as Untappd

ListView {

    function toast(checkin_id) {

    }

    function addComment(checkin_id, comment) {
        Untappd.postCheckinAddcomment(checkin_id, comment);
    }

    function removeComment(comment_id) {
        Untappd.postCheckinDeletecomment(comment_id);
    }
}

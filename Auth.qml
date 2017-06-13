import QtQuick 2.0
import QtQuick.Controls 1.4
import QtWebView 1.1

ApplicationWindow {
    id: authentication
    width: 640
    height: 480

    property string code: ""

    WebView {
        id: webView
        anchors.fill: parent

        url: "https://untappd.com/oauth/authenticate/?client_id=%1&response_type=code&redirect_url=%2".arg(clientId).arg(redirectUrl)

        onLoadingChanged: {
            var reg = new RegExp('^' + redirectUrl.replace(/\//g, '\\/') + '\\/\\?code=(.*)');
            if (reg.exec(loadRequest.url.toString())) {
                code = RegExp.$1
                authentication.close();
            }
        }
    }
}

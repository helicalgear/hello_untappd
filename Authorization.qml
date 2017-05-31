import QtQuick 2.0
import QtQuick.Controls 1.4
import QtWebKit 3.0

WebView {

    id: webView

    Timer {
        running: settings.readData('AccessToken', '') !== ""
        interval: 100
        onTriggered: mainView.removeTab(0)
    }

    url: "https://untappd.com/oauth/authenticate/?client_id=%1&response_type=code&redirect_url=%2".arg(ClientId).arg(RedirectUrl)

    onLoadingChanged: {
        var reg = new RegExp('^' + RedirectUrl.replace(/\//g, '\\/') + '\\/\\?code=(.*)');
        if (reg.exec(loadRequest.url.toString())) {
            webView.url = '';
            var xhr = new XMLHttpRequest;
            xhr.open("GET", "https://untappd.com/oauth/authorize/?client_id=%1&client_secret=%2&response_type=code&redirect_url=%3&code=%4".arg(ClientId).arg(ClientSecret).arg(RedirectUrl).arg(RegExp.$1), true);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4) {
                    switch (xhr.status) {
                    case 200:
                        var jsn = JSON.parse(xhr.responseText);
                        settings.saveData('AccessToken', jsn.response.access_token);
                        mainView.removeTab(0);
                        break;
                    case 401:
                        break;
                    default:
                        break;
                    }
                }
            }
            xhr.send();
        }
    }
}

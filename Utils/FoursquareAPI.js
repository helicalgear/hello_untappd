// Venues Search
function getVenuesSearch(callback, param) {
    var parameter_list = [];
    for (var key in param) {
        if (!(param[key] === "" || param[key] === 0 || param[key] === "off")) {
            parameter_list.push("%1=%2".arg(key).arg(param[key]));
        }
    }
    var parameters = parameter_list.join('&');
    accessAPI(function(result, response, notifications) {
        if (result) {
            callback( Object.keys(response.venues), response.venues );
        } else {
            callback( -1, response );
        }
    }, "GET", "venues/search", "%1".arg(parameters));
}

// Access to API
function accessAPI(callback, method, endpoint, parameters) {
    var xhr = new XMLHttpRequest;
    var param_get = (method === "GET" && parameters !== "") ? "%1&".arg(parameters) : "";
    var param_post = (method === "POST") ? parameters : "";
    var url = "https://api.foursquare.com/v2/%1?%2client_id=%3&client_secret=%4&v=%5".arg(endpoint).arg(param_get).arg(fsClientId).arg(fsClientSecret).arg(fsVersion);
    xhr.open(method, url, true);
    if (debug) { console.log(url); }
    if (method === "POST") { xhr.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' ); }
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var jsn = JSON.parse(xhr.responseText);
            switch (xhr.status) {
            case 200:
                if ( typeof jsn.response.error === 'undefined' ) {
                    callback(true, jsn.response, {});
                } else {
                    callback(false, { "code": "000", "error_detail": jsn.response.error }, {});
                }
                if (debug) {
                    console.log(jsn.meta.code);
                }
                break;
            default:
                callback(false, jsn.meta, {});
                if (debug) {
                    console.log(jsn.meta.code);
                    console.log(jsn.meta.error_detail);
                }
                break;
            }
        }
    }
    xhr.send(param_post);
}

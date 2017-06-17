// UNTAPPD API Documentation:
// https://untappd.com/api/docs

// _Feeds_
// Activity Feed
function getCheckinRecent(callback) {
    accessAPI( function(jsn) { callback( jsn.checkins.count, jsn.checkins.items ); }, "GET", "checkin/recent", "");
}

// User Activity Feed
function getUserCheckins(callback, user_name) {
    accessAPI( function(jsn) { callback( jsn.checkins.count, jsn.checkins.items ); }, "GET", "user/checkins/%1".arg(user_name), "" );
}

// The Pub
function getThepubLocal(callback, param) {
    var parameter_list = [];
    for (var key in param) {
        if (!(param[key] === "" || param[key] === 0 || param[key] === "off")) {
            parameter_list.push("%1=%2".arg(key).arg(param[key]));
        }
    }
    var parameters = parameter_list.join('&');
    accessAPI(function(jsn) { callback( jsn.checkins.count, jsn.checkins.items ); }, "GET", "thepub/local", "%1".arg(parameters));
}

// Venue Activity Feed
function getVenueCheckins(callback, venue_id) {
    accessAPI(function(jsn) { callback( jsn.checkins.count, jsn.checkins.items ); }, "GET", "venue/checkins/%1".arg(venue_id), "");
}

// Beer Activity Feed
function getBeerCheckins(callback, bid) {
    accessAPI(function(jsn) { callback( jsn.checkins.count, jsn.checkins.items ); }, "GET", "beer/checkins/%1".arg(bid), "");
}

// Brewery Activity Feed
function getBreweryCheckins(callback, brewery_id) {
    accessAPI(function(jsn) { callback( jsn.checkins.count, jsn.checkins.items ); }, "GET", "brewery/checkins/%1".arg(brewery_id), "");
}

//Notifications
function getNotifications(callback, sw) {
    accessAPI(function(jsn) { callback( jsn[sw].count, jsn[sw].items ); }, "GET", "notifications", "");
}

// _Info_
// User Info
function getUserInfo(callback, user_name) {
    accessAPI(function(jsn) { callback(jsn.user); }, "GET", "user/info/%1".arg(user_name), "");
}

// User With List
function getUserWishlist(callback, user_name) {
    accessAPI(function(jsn) { callback(jsn.beers.count, jsn.beers.items); }, "GET", "user/wishlist/%1".arg(user_name), "");
}

// User Friends
function getUserFriends(callback, user_name) {
    accessAPI(function(jsn) { callback(jsn.count, jsn.items); }, "GET", "user/friends/%1".arg(user_name), "");
}

// User Badges
function getUserBadges(callback, user_name) {
    accessAPI(function(jsn) { callback(jsn.count, jsn.items);  }, "GET", "user/badges/%1".arg(user_name), "");
}

// User Beers
function getUserBeers(callback, user_name) {
    accessAPI(function(jsn) { callback(jsn.beer.count, jsn.beer.items); }, "GET", "user/beers/%1".arg(user_name), "");
}

// Brewery Info
function getBreweryInfo(callback, brewery_id) {
    accessAPI(function(jsn) { callback(jsn.brewery); }, "GET", "brewery/info/%1".arg(brewery_id), "");
}

// Beer Info
function getBeerInfo(callback, bid) {
    accessAPI(function(jsn) { callback(jsn.beer); }, "GET", "beer/info/%1".arg(bid), "");
}

// Venue Info
function getVenueInfo(callback, venue_id) {
    accessAPI(function(jsn) { callback(jsn.venue); }, "GET", "brewery/info/%1".arg(venue_id), "");
}

// _Search_
// Search Beer
function getSearchBeer(callback, query) {
    accessAPI(function(jsn) { callback(jsn.beers.count, jsn.beers.items); }, "GET", "search/beer", "q=%1".arg(query));
}

// Search Brewery
function getSearchBrewery(callback, query) {
    accessAPI(function(jsn) { callback(jsn.found, jsn.brewery); }, "GET", "search/brewery", "q=%1".arg(query));
}

// _Actions_
// Checkin
function postCheckinAdd(param) {
    var parameter_list = [];
    for (var key in param) {
        if (!(param[key] === "" || param[key] === 0 || param[key] === "off")) {
            parameter_list.push("%1=%2".arg(key).arg(param[key]));
        }
    }
    var parameters = parameter_list.join('&');
    accessAPI(function(jsn) {}, "POST", "checkin/add", parameters);
}

// Toast / Untoast
function postCheckinToast(checkin_id) {
    accessAPI(function(jsn) {}, "POST", "checkin/toast/%1".arg(checkinId), "");
}

// Pending Friends
function getUserPending(callback) {
    accessAPI(function(jsn) { callback(jsn.count, jsn.items); }, "GET", "user/pending", "");
}

// Request(Add) Friend
function getFriendRequest(target_id) {
    accessAPI(function(jsn) {}, "GET", "friend/request/%1".arg(target_id), "");
}

// Remove Friend
function getFriendRemove(target_id) {
    accessAPI(function(jsn) {}, "GET", "friend/remove/%1".arg(target_id), "");
}

// Accept Friend
function getFriendAccept(target_id) {
    accessAPI(function(jsn) {}, "GET", "friend/accept/%1".arg(target_id), "");
}

// Reject Friend
function getFriendReject(target_id) {
    accessAPI(function(jsn) {}, "GET", "friend/reject/%1".arg(target_id), "");
}

// Add Comment
function postcheckinAddcomment(checkin_id, comment) {
    accessAPI(function(jsn) {}, "POST", "checkin/addcomment/%1".arg(checkin_id), "comment=%1".arg(comment).replace(/%20/, '+'));
}

// Remove Comment
function postcheckinDeletecomment(comment_id) {
    accessAPI(function(jsn) {}, "POST", "checkin/deletecomment/%1".arg(comment_id), "");
}

// Add to Wish List
function getUserWishlistAdd(bid) {
    accessAPI(function(jsn) {}, "GET", "user/wishlist/add", "bid=%1".arg(bid));
}

// Remove from Wish List
function getUserWishlistDelete(bid) {
    accessAPI(function(jsn) {}, "GET", "user/wishlist/delete", "bid=%1".arg(bid));
}

// Foursqaure Lookup
function getVenueFoursquare_lookup(callback, venue_id) {
    accessAPI(function(jsn) { callback(jsn.count, jsn.items); }, "GET", "venue/foursquare_lookup/%1".arg(venue_id), "");
}

// Access to API
function accessAPI(callback, method, endpoint, parameters) {
    var xhr = new XMLHttpRequest;
    var param_get = (method === "GET" && parameters !== "") ? "%1&".arg(parameters) : "";
    var param_post = (method === "POST") ? parameters : "";
    var url = "https://api.untappd.com/v4/%1?%2access_token=%3".arg(endpoint).arg(param_get).arg(settings.readData('AccessToken', ''));
    console.log(url)
    xhr.open(method, url, true);
    if (method === "POST") { xhr.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' ); }
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var jsn = JSON.parse(xhr.responseText);
            switch (xhr.status) {
            case 200:
                callback(jsn.response);
                console.log(jsn.meta.code);
                break;
            default:
                console.log(jsn.meta.code);
                console.log(jsn.meta.error_detail);
                break;
            }
        }
    }
    xhr.send(param_post);
}

// OAuth
function getAccessToken(code) {
    var xhr = new XMLHttpRequest;
    var url = "https://untappd.com/oauth/authorize/?client_id=%1&client_secret=%2&response_type=code&redirect_url=%3&code=%4".arg(clientId).arg(clientSecret).arg(redirectUrl).arg(code);
    xhr.open("GET", url, true);
    xhr.onreadystatechange = function() {
        if (xhr.readyState === 4) {
            switch (xhr.status) {
            case 200:
                var jsn = JSON.parse(xhr.responseText);
                settings.saveData('AccessToken', jsn.response.access_token);
                accessAPI(function(user_info) {
                    settings.saveData("foursquare", user_info.contact.foursquare);
                    settings.saveData("twitter", user_info.contact.twitter);
                    settings.saveData("facebook", user_info.contact.facebook);
                    console.log("Authenticated as %1".arg(user_info.user.user_name));
                }, "GET", "user/info/", "");
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

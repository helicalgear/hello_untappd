// UNTAPPD API Documentation:
// https://untappd.com/api/docs

// _Feeds_
// Activity Feed
function getCheckinRecent() {
    var parameter = "";
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++){
            if (Object.keys(items[n].venue).length === 0) { items[n].venue = {} }
            checkinRecent.append(items[n]);
        }
    }, "GET", "checkin/recent", "");
}

// User Activity Feed
function getUserCheckins(userName) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++){
            if (Object.keys(items[n].venue).length === 0) { items[n].venue = {} }
            userCheckins.append(items[n]);
        }
    }, "GET", "user/checkins/%1".arg(userName), "");
}

// The Pub
function getThepubLocal(param) {
    var parameters = "";
    parameters += "lat=%1&".arg(param.lat);
    parameters += "lng=%1&".arg(param.lng);
    if (param.radius !== undefined) { parameters += "radius=%1&".arg(param.radius); }
    parameters += "dist_pref=%1&".arg(distPref);
    getData(function(jsn) {
        var items = jsn.checkins.items;
        var venue_list = [];
        for (var n=0; n<jsn.checkins.count; n++) {
            if ( venue_list.indexOf(items[n].venue.venue_id) === -1 ) {
                thepubLocal.append(items[n]);
                venue_list.push(items[n].venue.venue_id);
            }
        }
    }, "GET", "thepub/local", "%1".arg(parameters));
}

// Venue Activity Feed
function getVenueCheckins(venueId) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++) {
            venueCheckins.append(items[n]);
        }
    }, "GET", "venue/checkins/%1".arg(venueId), "");
}

// Beer Activity Feed
function getBeerCheckins(beerId) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++) {
            if (Object.keys(items[n].venue).length === 0) { items[n].venue = {} }
            beerCheckins.append(items[n]);
        }
    }, "GET", "beer/checkins/%1".arg(beerId), "");
}

// Brewery Activity Feed
function getBreweryCheckins(breweryId) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        if (Object.keys(items[n].venue).length === 0) { items[n].venue = {} }
        breweyCheckins.append(items[n])
    }, "GET", "brewery/checkins/%1".arg(breweryId), "");
}

//Notifications
function getNotifications(sw) {
    getData(function(jsn) {
        var items = jsn[sw].items;
        for (var n=0; n<jsn[sw].count; n++) {
            if (sw === "notification" && Object.keys(items[n].venue).length === 0) { items[n].venue = {} }
            notifications.append(items[n]);
        }
    }, "GET", "notifications", "");
}

// _Info_
// User Info
function getUserInfo(userName) {
    getData(function(jsn) {
        userInfo = jsn.user;
    }, "GET", "user/info/%1".arg(userName), "");
}

// User With List
function getUserWishlist(userName) {
    getData(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            userWishlist.append(items[n]);
        }
    }, "GET", "user/wishlist/%1".arg(userName), "");
}

// User Friends
function getUserFriends(userName) {
    getData(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.beers.count; n++) {
            userFriends.append(items[n]);
        }
    }, "GET", "user/friends/%1".arg(userName), "");
}

// User Badges
function getUserBadges(userName) {
    getData(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.beers.count; n++) {
            userBadges.append(items[n]);
        }
    }, "GET", "user/badges/%1".arg(userName), "");
}

// User Beers
function getUserBeers(userName) {
    getData(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            userBeers.append(items[n]);
        }
    }, "GET", "user/beers/%1".arg(userName), "");
}

// Brewery Info
function getBreweryInfo(breweryId) {
    getData(function(jsn) {
        breweryInfo = jsn.brewery;
    }, "GET", "brewery/info/%1".arg(breweryId), "");
}

// Beer Info
function getBeerInfo(beerId) {
    getData(function(jsn) {
        beerInfo = jsn.beer;
    }, "GET", "beer/info/%1".arg(beerId), "");
}

// Venue Info
function getVenueInfo(venueId) {
    getData(function(jsn) {
        venueInfo = jsn.venue;
    }, "GET", "brewery/info/%1".arg(breweryId), "");
}

// _Search_
// Search Beer
function getSearchBeer(words, param) {
    getData(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            searchBeer.append(items[n]);
        }
    }, "GET", "search/beer", "q=%1&".arg(words));
}

// Search Brewery
function getSearchBrewery(words, param) {
    getData(function(jsn) {
        var items = jsn.brewery;
        for (var n=0; n<jsn.found; n++) {
            searchBrewery.append(items[n].brewery);
        }
    }, "GET", "search/brewery", "q=%1&".arg(words));
}

// _Actions_
// Checkin
function postCheckinAdd(param) {
    var parameters = "gmt_offset=%1&timezone=%2".arg(tzOffset).arg(timeZone);
    parameters += "&bid=%1".arg(param.bid);
    parameters += "&facebook=%1".arg(param.facebook);
    parameters += "&twitter=%1".arg(param.twitter);
    parameters += "&foursqare=%1".arg(param.foursqare);
    if (param.foursquare === "on") { parameters += "&foursquare_id=%1".arg(param.foursquare_id) }
    if (param.rating !== 0) { parameters += "&rating=%1".arg(param.rating) }
    //
    getData(function(jsn) {
        console.log("Check-in: %1".arg(jsn.result));
    }, "POST", "checkin/add", parameters);
}

// Toast / Untoast
function postCheckinToast(checkinId) {
    getData(function(jsn) {
        likeType = jsn.like_type;
    }, "POST", "checkin/toast/%1".arg(checkinId), "");
}

// Pending Friends
function getUserPending() {
    getData(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "user/pending", "");
}

// Request(Add) Friend
function getFriendRequest(targetId) {
    getData(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/request/%1".arg(targetId), "");
}

// Remove Friend
function getFriendRemove(targetId) {
    getData(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/remove/%1".arg(targetId), "");
}

// Accept Friend
function getFriendAccept(targetId) {
    getData(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/accept/%1".arg(targetId), "");
}

// Reject Friend
function getFriendReject(targetId) {
    getData(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/reject/%1".arg(targetId), "");
}

// Add Comment
function postcheckinAddcomment(checkinId, comment) {
    postData(function(jsn) {
        postResult = jsn.result;
    }, "GET", "checkin/addcomment/%1".arg(checkinId), "comment=%1".arg(comment).replace(/%20/, '+'));
}

// Remove Comment
function postcheckinDeletecomment(commentId) {
    postData(function(jsn) {
        postResult = jsn.result;
    }, "GET", "checkin/deletecomment/%1".arg(commentId), "");
}

// Add to Wish List
function getUserWishlistAdd(beerId) {
    getData(function(jsn) {
        postResult = jsn.result;
    }, "GET", "user/wishlist/add", "%1&".arg(targetId));
}

// Remove from Wish List
function getUserWishlistDelete(beerId) {
    getData(function(jsn) {
        postResult = jsn.result;
    }, "GET", "user/wishlist/delete", "%1&".arg(targetId));
}

// Foursqaure Lookup
function getVenueFoursquare_lookup(venueId) {
    getData(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.count; n++) {
            listModel.append(items[n]);
        }
    }, "GET", "venue/foursquare_lookup/%1".arg(venueId), "");
}

// Access to API
function getData(callback, method, endpoint, parameters) {
    var xhr = new XMLHttpRequest;
    var param_get = (method === "GET") ? parameters : "";
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
                getData(function(user_info) {
                    settings.saveData('foursquare', user_info.user.contact.foursquare);
                    settings.saveData('twitter', user_info.user.contact.twitter);
                    settings.saveData('facebook', user_info.user.contact.facebook);
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

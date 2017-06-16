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
    var parameters = "lat=%1&lng=%2&".arg(param.lat).arg(param.lng);
    parameters += "radius=%1&dist_pref=%2&".arg(param.radius).arg(param.dist_pref);
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
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of records that you will return (max 25, default 25)
    accessAPI(function(jsn) { callback( jsn[sw].count, jsn[sw].items ); }, "GET", "notifications", "");
}

// _Info_
// User Info
function getUserInfo(callback, user_name) {
    // compact (string, optional) - You can pass "true" here only show the user infomation,
    // and remove the "checkins", "media", "recent_brews", etc attributes
    accessAPI(function(jsn) {
        callback(jsn.user);
    }, "GET", "user/info/%1".arg(user_name), "");
}

// User With List
function getUserWishlist(callback, user_name) {
    // sort (string, optional) - You can sort the results using these values:
    //                           date - sorts by date (default),
    //                           checkin - sorted by highest checkin,
    //                           highest_rated - sorts by global rating descending order,
    //                           lowest_rated - sorts by global rating ascending order,
    //                           highest_abv - highest ABV from the wishlist,
    //                           lowest_abv - lowest ABV from the wishlist
    accessAPI(function(jsn) { callback(jsn.beers.count, jsn.beers.items); }, "GET", "user/wishlist/%1".arg(user_name), "");
}

// User Friends
function getUserFriends(callback, user_name) {
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of records that you will return (max 25, default 25)
    accessAPI(function(jsn) { callback(jsn.beers.count, jsn.items); }, "GET", "user/friends/%1".arg(user_name), "");
}

// User Badges
function getUserBadges(userName) {
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of badges to return in your result set
    accessAPI(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.beers.count; n++) {
            userBadges.append(items[n]);
        }
    }, "GET", "user/badges/%1".arg(userName), "");
}

// User Beers
function getUserBeers(userName) {
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of results to return, max of 50, default is 25
    // sort (string, optional) - Your can sort the results using these values:
    //                           date - sorts by date (default),
    //                           checkin - sorted by highest checkin,
    //                           highest_rated - sorts by global rating descending order,
    //                           lowest_rated - sorts by global rating ascending order,
    //                           highest_rated_you - the user's highest rated beer,
    //                           lowest_rated_you - the user's lowest rated beer
    accessAPI(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            userBeers.append(items[n]);
        }
    }, "GET", "user/beers/%1".arg(userName), "");
}

// Brewery Info
function getBreweryInfo(breweryId) {
    // compact (string, optional) - You can pass "true" here only show the brewery infomation,
    // and remove the "checkins", "media", "beer_list", etc attributes
    accessAPI(function(jsn) {
        breweryInfo = jsn.brewery;
    }, "GET", "brewery/info/%1".arg(breweryId), "");
}

// Beer Info
function getBeerInfo(callback, bid) {
    // compact (string, optional) - You can pass "true" here only show the beer infomation,
    // and remove the "checkins", "media", "variants", etc attributes
    accessAPI(function(jsn) { callback(jsn.beer); }, "GET", "beer/info/%1".arg(bid), "");
}

// Venue Info
function getVenueInfo(venueId) {
    // compact (string, optional) - You can pass "true" here only show the venue infomation,
    // and remove the "checkins", "media", "top_beers", etc attributes
    accessAPI(function(jsn) {
        venueInfo = jsn.venue;
    }, "GET", "brewery/info/%1".arg(breweryId), "");
}

// _Search_
// Search Beer
function getSearchBeer(callback, query) {
    // sort (string, optional) - Your can sort the results using these values:
    //                           checkin - sorts by checkin count (default),
    //                           name - sorted by alphabetic beer name
    accessAPI(function(jsn) { callback(jsn.beers.count, jsn.beers.items); }, "GET", "search/beer", "q=%1&".arg(query));
}

// Search Brewery
function getSearchBrewery(callback, query) {
    accessAPI(function(jsn) { callback(jsn.brewery.count, jsn.brewery); }, "GET", "search/brewery", "q=%1&".arg(words));
}

// _Actions_
// Checkin
function postCheckinAdd(param) {
    var parameters = "gmt_offset=%1&timezone=%2".arg(tzOffset).arg(timeZone);
    parameters += "&bid=%1".arg(param.bid);
    parameters += "&facebook=%1".arg(param.facebook);
    parameters += "&twitter=%1".arg(param.twitter);
    parameters += "&foursqare=%1".arg(param.foursqare);
    if (param.foursquare === "on") {
        parameters += "&geolat=%1".arg(param.geolat);
        parameters += "&geolng=%1".arg(param.getlng);
    }
    parameters += "&foursquare_id=%1".arg(param.foursquare_id)
    if (param.rating !== 0) { parameters += "&rating=%1".arg(param.rating) }
    if (param.shout !== 0) { parameters += "&rating=%1".arg(param.shout) }
    //
    accessAPI(function(jsn) {
        console.log("Check-in: %1".arg(jsn.result));
    }, "POST", "checkin/add", parameters);
}

// Toast / Untoast
function postCheckinToast(checkinId) {
    accessAPI(function(jsn) {
        likeType = jsn.like_type;
    }, "POST", "checkin/toast/%1".arg(checkinId), "");
}

// Pending Friends
function getUserPending() {
    // offset (int, optional) - The numeric offset that you what results to start
    // limit (int, optional) - The number of results to return. (default is all)
    accessAPI(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "user/pending", "");
}

// Request(Add) Friend
function getFriendRequest(targetId) {
    accessAPI(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/request/%1".arg(targetId), "");
}

// Remove Friend
function getFriendRemove(targetId) {
    accessAPI(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/remove/%1".arg(targetId), "");
}

// Accept Friend
function getFriendAccept(targetId) {
    accessAPI(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/accept/%1".arg(targetId), "");
}

// Reject Friend
function getFriendReject(targetId) {
    accessAPI(function(jsn) {
        // add the properties which are needed from apps.
    }, "GET", "friend/reject/%1".arg(targetId), "");
}

// Add Comment
function postCheckinAddcomment(checkinId, comment) {
    accessAPI(function(jsn) {
        postResult = jsn.result;
    }, "POST", "checkin/addcomment/%1".arg(checkinId), "comment=%1".arg(comment).replace(/%20/, '+'));
}

// Remove Comment
function postCheckinDeletecomment(commentId) {
    accessAPI(function(jsn) {
        postResult = jsn.result;
    }, "POST", "checkin/deletecomment/%1".arg(commentId), "");
}

// Add to Wish List
function getUserWishlistAdd(beerId) {
    accessAPI(function(jsn) {
        postResult = jsn.result;
    }, "GET", "user/wishlist/add", "%1&".arg(targetId));
}

// Remove from Wish List
function getUserWishlistDelete(beerId) {
    accessAPI(function(jsn) {
        postResult = jsn.result;
    }, "GET", "user/wishlist/delete", "%1&".arg(targetId));
}

// Foursqaure Lookup
function getVenueFoursquare_lookup(venueId) {
    accessAPI(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.count; n++) {
            foursquareLookup.append(items[n]);
        }
    }, "GET", "venue/foursquare_lookup/%1".arg(venueId), "");
}

// Access to API
function accessAPI(callback, method, endpoint, parameters) {
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

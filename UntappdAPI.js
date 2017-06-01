// UNTAPPD API Documentation:
// https://untappd.com/api/docs

// _Feeds_
// Activity Feed
function getCheckinRecent() {
    var parameter = "";
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++){
            var data = {
                "checkin_id": items[n].checkin_id,
                "created_at": items[n].created_at,
                "checkin_comment": items[n].checkin_comment,
                "user_name": items[n].user.user_name,
                "first_name": items[n].user.first_name,
                "last_name": items[n].user.last_name,
                "user_avatar": items[n].user.user_avatar,
                "beer_id": items[n].beer.bid,
                "beer_name": items[n].beer.beer_name,
                "beer_label": items[n].beer.beer_label,
                "beer_style": items[n].beer.beer_style,
                "wish_list": items[n].beer.wish_list,
                "brewery_id": items[n].brewery.brewery_id,
                "brewery_name": items[n].brewery.brewery_name,
                "brewery_label": items[n].brewery.brewery_label,
                "country_name": items[n].brewery.country_name,
                "venue_id": items[n].venue.venue_id,
                "venue_name": items[n].venue.venue_name,
                "venue_icon": items[n].venue.venue_icon,
                "photo": (items[n].media.count > 0) ? items[n].media.items[0].photo.photo_img_md : ""
            };
            checkinRecent.append(data);
        }
    }, "checkin/recent", "");
}

// User Activity Feed
function getUserCheckins(userName) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++){
            var data = {
                "checkin_id": items[n].checkin_id,
                "created_at": items[n].created_at,
                "checkin_comment": items[n].checkin_comment,
                "user_name": items[n].user.user_name,
                "first_name": items[n].user.first_name,
                "last_name": items[n].user.last_name,
                "user_avatar": items[n].user.user_avatar,
                "beer_id": items[n].beer.bid,
                "beer_name": items[n].beer.beer_name,
                "beer_label": items[n].beer.beer_label,
                "beer_style": items[n].beer.beer_style,
                "wish_list": items[n].beer.wish_list,
                "brewery_id": items[n].brewery.brewery_id,
                "brewery_name": items[n].brewery.brewery_name,
                "brewery_label": items[n].brewery.brewery_label,
                "country_name": items[n].brewery.country_name,
                "venue_id": items[n].venue.venue_id,
                "venue_name": items[n].venue.venue_name,
                "venue_icon": items[n].venue.venue_icon,
                "photo": (items[n].media.count > 0) ? items[n].media.items[0].photo.photo_img_md : ""
            };
            userCheckins.append(data);
        }
    }, "user/checkins/%1".arg(userName), "");
}

// The Pub
function getThepubLocal(param) {
    var parameters = "";
    parameters += "lat=%1&".arg(param.lat);
    parameters += "lng=%1&".arg(param.lng);
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++) {
            var data = {
            }
            thepubLocal.append(data);
        }
    }, "thepub/local", "%1".arg(parameters));
}

// Venue Activity Feed
function getVenueCheckins(venueId) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++) {
            var data = {
            }
            venueCheckins.append(data);
        }
    }, "venue/checkins/%1".arg(venueId), "");
}

// Beer Activity Feed
function getBeerCheckins(beerId) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++) {
            var data = {
            }
            beerCheckins.append(data);
        }
    }, "beer/checkins/%1".arg(beerId), "");
}

// Brewery Activity Feed
function getBreweryCheckins(breweryId) {
    getData(function(jsn) {
        var items = jsn.checkins.items;
        for (var n=0; n<jsn.checkins.count; n++) {
            var data = {
            }
            breweryCheckins.append(data);
        }
    }, "brewery/checkins/%1".arg(breweryId), "");
}

//Notifications
function getNotifications() {
    getData(function(jsn) {
        var news_items = jsn.news.items;
        var notifications_items = jsn.notifications.items;
//        for (var n=0; n<jsn.checkins.count; n++){
//            var item = jsn.checkins.items[n];
//            var data = {
//            };
//            listModel.append(data);
//        }
    }, "notifications", "");
}

// _Info_
// User Info
function getUserInfo(userName) {
    getData(function(jsn) {
        userInfo = {
            "user_name": jsn.user.user_name,
            "first_name": jsn.user.first_name,
            "last_name": jsn.user.last_name,
            "user_avatar": jsn.user.user_avatar,
            "user_cover_photo": jsn.user.user_cover_photo,
            "location": jsn.user.location,
            "bio": jsn.user.bio,
            "total_checkins": jsn.user.stats.total_checkins,
            "total_beers": jsn.user.stats.total_beers,
            "total_friends": jsn.user.stats.total_friends,
            "total_badges": jsn.user.stats.total_badges
        }
    }, "user/info/%1".arg(userName), "");
}

// User With List
function getUserWishlist(userName) {
    getData(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            var data = {
                "beer_name": items.beer.beer_name,
                "beer_id": items.beer.beer_id,
                "beer_label": items.beer.beer_label,
                "brewery_name": items.brewery.brewery_name
            }
            userWishlist.append(data);
        }
    }, "user/wishlist/%1".arg(userName), "");
}

// User Friends
function getUserFriends(userName) {
    getData(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.beers.count; n++) {
            var data = {
                "user_name": items.user.user_name,
                "user_id": items.user.uid,
                "user_avatar": items.user.avatar
            }
            userFriends.append(data);
        }
    }, "user/friends/%1".arg(userName), "");
}

// User Badges
function getUserBadges(userName) {
    getData(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.beers.count; n++) {
            var data = {
                "badge_id": items.user_badge_id,
                "badge_name": items.badge_name,
                "badge_image": items.badge_image_md
            }
            userBadges.append(data);
        }
    }, "user/badges/%1".arg(userName), "");
}

// User Beers
function getUserBeers(userName) {
    getData(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            var data = {
                "beer_name": items.beer_name,
                "beer_id": items.beer_id,
                "beer_label": items.beer_label
            }
            userBeers.append(data);
        }
    }, "user/beers/%1".arg(userName), "");
}

// Brewery Info
function getBreweryInfo(breweryId) {
    getData(function(jsn) {
        breweryInfo = {
            "brewery_name": jsn.brewery.brewery_name,
            "brewery_label": jsn.brewery.brewery_label
        }
    }, "brewery/info/%1".arg(breweryId), "");
}

// Beer Info
function getBeerInfo(beerId) {
    getData(function(jsn) {
        beerInfo = {
            "beer_name": jsn.beer.beer_name,
            "beer_label": jsn.beer.beer_label,
            "beer_abv": jsn.beer.beer_abv,
            "beer_ibu": jsn.beer.beer_ibu,
            "beer_description": jsn.beer.beer_description,
            "beer_style": jsn.beer.beer_style,
            "brewery_name": jsn.beer.brewery.brewery_name,
            "brewery_label": jsn.beer.brewery.brewery_label
        }
    }, "beer/info/%1".arg(beerId), "");
}

// Venue Info
function getVenueInfo(venueId) {
    getData(function(jsn) {
    }, "brewery/info/%1".arg(breweryId), "");
}

// _Search_
// Search Beer
function getSearchBeer(words, param) {
    getData(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            var data = {
                "beer_name": items[n].beer.beer_name,
                "beer_id": items[n].beer.bid,
                "beer_label": items[n].beer.beer_label,
                "beer_style": items[n].beer.beer_style,
                "brewery_name": items[n].brewery.brewery_name,
                "brewery_label": items[n].brewery.brewery_label
            }
            searchBeer.append(data);
        }
    }, "search/beer", "q=%1&".arg(words));
}

// Search Brewery
function getSearchBrewery(words, param) {
    getData(function(jsn) {
        var items = jsn.brewery;
        for (var n=0; n<jsn.found; n++) {
            var data = {
                "brewery_name": items[n].brewery.brewery_name,
                "brewry_id": items[n].brewery.brewery_id,
                "country_name": items[n].brewery.country_name
            }
            searchBrewery.append(data);
        }
    }, "search/brewery", "q=%1&".arg(words));
}

// _Actions_
// Checkin
function postCheckinAdd(param) {
    var parameters = "";
    parameters += "gmt_offset=%1&".arg(param.offset);
    parameters += "timezone=%1&".arg(param.timezone);
    parameters += "bid=%1&".arg(param.bid);
    postData(function(jsn) {

        console.log(jsn.response.result);
    }, "checkin/add", parameters);
}

// Toast / Untoast
function postCheckinToast(checkinId) {
    postData(function(jsn) {
        likeType = jsn.like_type;
    }, "checkin/toast/%1".arg(checkinId), "");
}

// Pending Friends
function getUserPending() {
    getData(function(jsn) {
    }, "user/pending", "");
}

// Request(Add) Friend
function getFriendRequest(targetId) {
    getData(function(jsn) {
    }, "friend/request/%1".arg(targetId), "");
}

// Remove Friend
function getFriendRemove(targetId) {
    getData(function(jsn) {
    }, "friend/remove/%1".arg(targetId), "");
}

// Accept Friend
function getFriendAccept(targetId) {
    getData(function(jsn) {
    }, "friend/accept/%1".arg(targetId), "");
}

// Reject Friend
function getFriendReject(targetId) {
    getData(function(jsn) {
    }, "friend/reject/%1".arg(targetId), "");
}

// Add Comment
function postcheckinAddcomment(checkinId, comment) {
    postData(function(jsn) {
    }, "checkin/addcomment/%1".arg(checkinId), "%1&".arg(comment));
}

// Remove Comment
function postcheckinDeletecomment(commentId) {
    postData(function(jsn) {
    }, "checkin/deletecomment/%1".arg(commentId), "");
}

// Add to Wish List
function getUserWishlistAdd(beerId) {
    getData(function(jsn) {
        apiStatus = jsn.result;
    }, "user/wishlist/add", "%1&".arg(targetId));
}

// Remove from Wish List
function getUserWishlistDelete(beerId) {
    getData(function(jsn) {
        apiStatus = jsn.result;
    }, "user/wishlist/delete", "%1&".arg(targetId));
}

// Foursqaure Lookup
function getVenueFoursquare_lookup(venueId) {
    getData(function(jsn) {
        var items = jsn.items;
        for (var n=0; n<jsn.count; n++) {
            data = {
                "venue_name": items.venue_name,
                "venue_id": items.venue_id,
                "foursqare_id": items.foursquare_id,
                "last_updated": items.last_updated
            }
            listModel.append(data);
        }
    }, "venue/foursquare_lookup/%1".arg(venueId), "");
}

// Access to API
function getData(callback, endpoint, parameters) {
    var xhr = new XMLHttpRequest;
    var url = "https://api.untappd.com/v4/%1?%2access_token=%3".arg(endpoint).arg(parameters).arg(settings.readData('AccessToken', ''));
    console.log(url);
    xhr.open("GET", url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var jsn = JSON.parse(xhr.responseText);
            switch (xhr.status) {
            case 200:
                callback(jsn.response);
                break;
            default:
                console.log(jsn.meta.error_detail);
                break;
            }
        }
    }
    xhr.send();
}

function postData(callback, endpoint, parameters) {
    var xhr = new XMLHttpRequest;
    var url = "https://api.untappd.com/v4/%1?access_token=%2".arg(endpoint).arg(settings.readData('AccessToken', ''));
    var snt = "%1".arg(parameters);
    console.log(url);
    xhr.open("POST", url, true);
    xhr.setRequestHeader( 'Content-Type', 'application/x-www-form-urlencoded' );
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            var jsn = JSON.parse(xhr.responseText);
            switch (xhr.status) {
            case 200:
                callback(jsn.response);
                break;
            default:
                console.log(jsn.meta.error_detail);
                break;
            }
        }
    }
    xhr.send(snt);
    console.log(snt);
}

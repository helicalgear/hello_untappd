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
    }, "GET", "checkin/recent", "");
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
    }, "GET", "user/checkins/%1".arg(userName), "");
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
    }, "GET", "thepub/local", "%1".arg(parameters));
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
    }, "GET", "venue/checkins/%1".arg(venueId), "");
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
    }, "GET", "beer/checkins/%1".arg(beerId), "");
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
    }, "GET", "brewery/checkins/%1".arg(breweryId), "");
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
    }, "GET", "notifications", "");
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
    }, "GET", "user/info/%1".arg(userName), "");
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
    }, "GET", "user/wishlist/%1".arg(userName), "");
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
    }, "GET", "user/friends/%1".arg(userName), "");
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
    }, "GET", "user/badges/%1".arg(userName), "");
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
    }, "GET", "user/beers/%1".arg(userName), "");
}

// Brewery Info
function getBreweryInfo(breweryId) {
    getData(function(jsn) {
        breweryInfo = {
            "brewery_name": jsn.brewery.brewery_name,
            "brewery_label": jsn.brewery.brewery_label
        }
    }, "GET", "brewery/info/%1".arg(breweryId), "");
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
            "brewery_name": jsn.brewery.brewery_name,
            "brewery_label": jsn.brewery.brewery_label
        }
    }, "GET", "beer/info/%1".arg(beerId), "");
}

// Venue Info
function getVenueInfo(venueId) {
    getData(function(jsn) {
    }, "GET", "brewery/info/%1".arg(breweryId), "");
}

// _Search_
// Search Beer
function getSearchBeer(words, param) {
    getData(function(jsn) {
        var items = jsn.beers.items;
        for (var n=0; n<jsn.beers.count; n++) {
            var data = {
                "beer_name": items[n].beer.beer_name,
                "beer_id": items[n].beer.beer_id,
                "beer_label": items[n].beer.beer_label,
                "beer_style": items[n].beer.beer_style,
                "brewery_name": items[n].brewery.brewery_name
            }
            searchBeer.append(data);
        }
    }, "GET", "search/beer", "q=%1&".arg(words));
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
    }, "GET", "search/brewery", "q=%1&".arg(words));
}

// _Actions_
// Checkin
function postCheckinAdd(param) {
    var parameters = "";
    parameters += "gmt_offset=&";
    parameters += "timezone=&";
    parameters += "bid=%1&".arg(param.beerId);
    getData(function(jsn) {
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
    }, "GET", "user/pending", "");
}

// Request(Add) Friend
function getFriendRequest(targetId) {
    getData(function(jsn) {
    }, "GET", "friend/request/%1".arg(targetId), "");
}

// Remove Friend
function getFriendRemove(targetId) {
    getData(function(jsn) {
    }, "GET", "friend/remove/%1".arg(targetId), "");
}

// Accept Friend
function getFriendAccept(targetId) {
    getData(function(jsn) {
    }, "GET", "friend/accept/%1".arg(targetId), "");
}

// Reject Friend
function getFriendReject(targetId) {
    getData(function(jsn) {
    }, "GET", "friend/reject/%1".arg(targetId), "");
}

// Add Comment
function postcheckinAddcomment(checkinId, comment) {
    getData(function(jsn) {
    }, "POST", "checkin/addcomment/%1".arg(checkinId), "%1&".arg(comment));
}

// Remove Comment
function postcheckinDeletecomment(commentId) {
    getData(function(jsn) {
    }, "POST", "checkin/deletecomment/%1".arg(commentId), "");
}

// Add to Wish List
function getUserWishlistAdd(beerId) {
    getData(function(jsn) {
        apiStatus = jsn.result;
    }, "GET", "user/wishlist/add", "%1&".arg(targetId));
}

// Remove from Wish List
function getUserWishlistDelete(beerId) {
    getData(function(jsn) {
        apiStatus = jsn.result;
    }, "GET", "user/wishlist/delete", "%1&".arg(targetId));
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
    }, "GET", "venue/foursquare_lookup/%1".arg(venueId), "");
}

// Access to API
function getData(callback, method, endpoint, parameters) {
    var xhr = new XMLHttpRequest;
    var url = "https://api.untappd.com/v4/%1?%2access_token=%3".arg(endpoint).arg(parameters).arg(settings.readData('AccessToken', ''));
    console.log(url);
    xhr.open(method, url, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            switch (xhr.status) {
            case 200:
                var jsn = JSON.parse(xhr.responseText).response;
                callback(jsn);
                break;
            default:
                break;
            }
        }
    }
    xhr.send();
}

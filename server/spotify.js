const fetch = require('node-fetch');
const constants = require('./constants');



const loadLibrary = async(tokens, io, sessionId) => {

    var items = [];



    /*const test = `[{"album":{"album_type":"album","artists":[{"external_urls":{"spotify":"https://open.spotify.com/artist/32WkQRZEVKSzVAAYqukAEA"},"href":"https://api.spotify.com/v1/artists/32WkQRZEVKSzVAAYqukAEA","id":"32WkQRZEVKSzVAAYqukAEA","name":"Lady A","type":"artist","uri":"spotify:artist:32WkQRZEVKSzVAAYqukAEA"}],"available_markets":["AD","AE","AG","AL","AM","AO","AR","AT","AU","AZ","BA","BB","BD","BE","BF","BG","BH","BI","BJ","BN","BO","BR","BS","BT","BW","BY","BZ","CA","CH","CI","CL","CM","CO","CR","CV","CW","CY","CZ","DE","DJ","DK","DM","DO","DZ","EC","EE","EG","ES","FI","FJ","FM","FR","GA","GB","GD","GE","GH","GM","GN","GQ","GR","GT","GW","GY","HK","HN","HR","HT","HU","ID","IE","IL","IN","IS","IT","JM","JO","KE","KG","KH","KI","KM","KN","KR","KW","KZ","LA","LB","LC","LI","LK","LR","LS","LT","LU","LV","MA","MC","MD","ME","MG","MH","MK","ML","MN","MO","MR","MT","MU","MV","MW","MX","MY","MZ","NA","NE","NG","NI","NL","NO","NP","NR","NZ","OM","PA","PE","PG","PH","PK","PL","PS","PT","PW","PY","QA","RO","RS","RU","RW","SA","SB","SC","SE","SG","SI","SK","SL","SM","SN","SR","ST","SV","SZ","TD","TG","TH","TL","TN","TO","TR","TT","TV","TW","TZ","UA","UG","US","UY","UZ","VC","VN","VU","WS","XK","ZA","ZM","ZW"],"external_urls":{"spotify":"https://open.spotify.com/album/3hnGcNi8oqGdwTm3CeniFA"},"href":"https://api.spotify.com/v1/albums/3hnGcNi8oqGdwTm3CeniFA","id":"3hnGcNi8oqGdwTm3CeniFA","images":[{"height":640,"url":"https://i.scdn.co/image/ab67616d0000b2733a2cc6c5cdd9f07a95efa51b","width":640},{"height":300,"url":"https://i.scdn.co/image/ab67616d00001e023a2cc6c5cdd9f07a95efa51b","width":300},{"height":64,"url":"https://i.scdn.co/image/ab67616d000048513a2cc6c5cdd9f07a95efa51b","width":64}],"name":"Need You Now","release_date":"2010-01-01","release_date_precision":"day","total_tracks":11,"type":"album","uri":"spotify:album:3hnGcNi8oqGdwTm3CeniFA"},"artists":[{"external_urls":{"spotify":"https://open.spotify.com/artist/32WkQRZEVKSzVAAYqukAEA"},"href":"https://api.spotify.com/v1/artists/32WkQRZEVKSzVAAYqukAEA","id":"32WkQRZEVKSzVAAYqukAEA","name":"Lady A","type":"artist","uri":"spotify:artist:32WkQRZEVKSzVAAYqukAEA"}],"available_markets":["AD","AE","AG","AL","AM","AO","AR","AT","AU","AZ","BA","BB","BD","BE","BF","BG","BH","BI","BJ","BN","BO","BR","BS","BT","BW","BY","BZ","CA","CH","CI","CL","CM","CO","CR","CV","CW","CY","CZ","DE","DJ","DK","DM","DO","DZ","EC","EE","EG","ES","FI","FJ","FM","FR","GA","GB","GD","GE","GH","GM","GN","GQ","GR","GT","GW","GY","HK","HN","HR","HT","HU","ID","IE","IL","IN","IS","IT","JM","JO","KE","KG","KH","KI","KM","KN","KR","KW","KZ","LA","LB","LC","LI","LK","LR","LS","LT","LU","LV","MA","MC","MD","ME","MG","MH","MK","ML","MN","MO","MR","MT","MU","MV","MW","MX","MY","MZ","NA","NE","NG","NI","NL","NO","NP","NR","NZ","OM","PA","PE","PG","PH","PK","PL","PS","PT","PW","PY","QA","RO","RS","RU","RW","SA","SB","SC","SE","SG","SI","SK","SL","SM","SN","SR","ST","SV","SZ","TD","TG","TH","TL","TN","TO","TR","TT","TV","TW","TZ","UA","UG","US","UY","UZ","VC","VN","VU","WS","XK","ZA","ZM","ZW"],"disc_number":1,"duration_ms":277573,"explicit":false,"external_ids":{"isrc":"USCN10900696"},"external_urls":{"spotify":"https://open.spotify.com/track/11EX5yhxr9Ihl3IN1asrfK"},"href":"https://api.spotify.com/v1/tracks/11EX5yhxr9Ihl3IN1asrfK","id":"11EX5yhxr9Ihl3IN1asrfK","is_local":false,"name":"Need You Now","popularity":70,"preview_url":"https://p.scdn.co/mp3-preview/efe8a78d99fbaa8c22df36f9eeab3cb288144648?cid=192ada156ff84c68bdefb8112fb7ce42","track_number":1,"type":"track","uri":"spotify:track:11EX5yhxr9Ihl3IN1asrfK"}]`;
    const testItems = JSON.parse(test);
    items = testItems;
    console.log(items);*/

    for (var i = 0; i < tokens.length; i++) {
        const token = tokens[i];

        var url = `${constants.SPOTIFY_BASE_URL}/me/tracks?offset=0&limit=50`;
        var intersectedItems = []; //keep track of our new items to replace old items


        console.log("loading libarry for token " + token);

        const options = {
            method: "GET",
            headers: { 'content-type': 'application/json', 'Accept': 'application/json', 'Authorization': `Bearer ${token}` },
        };
        var count = 0;
        while (url != null) {
            try {
                let result = await fetch(url, options);
                let json = await result.json();
                const newItems = json.items;
                console.log("new items: " + Object.keys(newItems).length);
                newItems.forEach(element => { //save each to map if doesnt exist
                    if (i == 0) { //first time we just add them all
                        intersectedItems.push(element.track);
                    } else {
                        //second time we only add it if it already exists
                        if (items.filter(e => e.id == element.track.id).length > 0) {
                            intersectedItems.push(element.track);
                        }
                    }
                });
                url = json.next;
                const message = `tracks ${json.offset}/${json.total} for user ${i + 1}/${tokens.length}`;

                if (io != null) {
                    console.log(message + " " + sessionId);
                    io.to(sessionId).emit('SESSION_LOADED', { "message": message });
                }

            } catch (er) {
                console.log("FAILED LOADING SOME DATA");

                url = null;
                console.log(er);
                if (io != null) {
                    io.to(sessionId).emit('SESSION_LOADED', { "message": "FAILED TO LOAD SOME DATA" });
                }
                continue;
            }
            if (count > 3) {
                // break; //TODO: remove to allow full thing to happen
            }
            count++;
        }

        items = intersectedItems;

    }



    console.log("completed with " + items.length + " length");
    if (io != null) {
        io.to(sessionId).emit('SESSION_LOADED', { "message": `${items.length} similar songs`, data: items.slice(0, 25) });
    }
    return items;

}

const test = async(req, res) => {
    console.log("test");
    const token = req.query.access_token;
    let t = await loadLibrary([token]);
    res.json(t);
}

const name = async(req, res) => {
    const token = req.query.access_token;
    console.log("----------- get name with token " + token);
    const url = "https://api.spotify.com/v1/me";
    const options = {
        method: "GET",
        headers: { 'content-type': 'application/json', 'Accept': 'application/json', 'Authorization': `Bearer ${token}` },
    };
    let result = await fetch(url, options);
    let json = await result.json();
    console.log(json);
    res.json(json);
}

exports.test = test;
exports.loadLibrary = loadLibrary;
exports.name = name;
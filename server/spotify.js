const fetch = require('node-fetch');
const constants = require('./constants');



const loadLibrary = async(tokens, io, sessionId) => {

    var items = [];

    for (var i = 0; i < tokens.length; i++) {
        const token = tokens[i];
        var intersectedItems = []; //keep track of our new items to replace old items
        console.log("loading libarry for token " + token);

        const options = {
            method: "GET",
            headers: { 'content-type': 'application/json', 'Accept': 'application/json', 'Authorization': `Bearer ${token}` },
        };

        var allSongs = [];

        //get playlists
        const suffix = ` for user ${i + 1}/${tokens.length}`;
        const playlistIds = await getUsersPlaylists(options);

        for (var n = 0; n < playlistIds.length; n++) {
            const id = playlistIds[n];
            const prefix = `Loading playlist ${n}/${playlistIds.length} `;
            const songsInPlaylist = await getAllSongsInPlaylist(options, id, (update) => {
                const message = `${prefix}got songs ${update}${suffix}`;
                console.log(message);
                if (io != null) {
                    io.to(sessionId).emit('SESSION_LOADED', { "message": message });
                }
            });

            allSongs = allSongs.concat(songsInPlaylist);
        }

        //get library
        const songsInLibrary = await getAllSongsInLibrary(options, (update) => {
            const message = `Loading saved songs ${update}${suffix}`;
            console.log(message);
            if (io != null) {
                io.to(sessionId).emit('SESSION_LOADED', { "message": message });
            }
        });

        //merge
        allSongs = allSongs.concat(songsInLibrary);

        console.log("got all songs");
        //console.log(allSongs)


        //intersect with last
        allSongs.forEach(element => { //save each to map if doesnt exist
            if (i == 0) { //first time we just add them all
                intersectedItems.push(element);
            } else {
                //second time we only add it if it already exists
                if (items.filter(e => e.id == element.id).length > 0) {
                    intersectedItems.push(element);
                }
            }
        });

        items = intersectedItems;

    }



    console.log("completed with " + items.length + " length");
    if (io != null) {
        io.to(sessionId).emit('SESSION_LOADED', { "message": `${items.length} similar songs`, data: items.slice(0, 25) });
    }
    return items;

}

const getAllSongsInLibrary = async(options, update) => {
    var url = `${constants.SPOTIFY_BASE_URL}/me/tracks?offset=0&limit=50`
    var songs = [];
    while (url != null) {
        let result = await fetch(url, options);
        let json = await result.json();
        json.items.forEach((element) => {
            songs.push(element.track);
        });

        if (update) {
            update(`${json.offset}/${json.total}`);
        }
        url = json.next;
    }
    return songs;
}

const getAllSongsInPlaylist = async(options, playlistId, update) => {
    var url = `${constants.SPOTIFY_BASE_URL}/playlists/${playlistId}/tracks`
    var songs = [];

    while (url != null) {

        let result = await fetch(url, options);
        let json = await result.json();
        json.items.forEach((element) => {
            songs.push(element.track);
        });

        if (update) {
            update(`${json.offset}/${json.total}`);
        }

        url = json.next;

    }
    return songs;
}

const getUsersPlaylists = async(options) => {
    var playlistIds = [];
    var url = `${constants.SPOTIFY_BASE_URL}/me/playlists`;
    while (url != null) {
        let result = await fetch(url, options);
        let json = await result.json();
        json.items.forEach((element) => {
            playlistIds.push(element.id);
        });
        url = json.next;
    }
    return playlistIds;
}

const test = async(req, res) => {
    console.log("test");
    const token = "BQDuAGOjw_ClAr-FCeCHnzNBKZgRKahq5KlgnwHtA8tjHPe2jF7MopBlmeS3W8pCQNB3UK4MhhPB4G2v_VX1JgWj8QjlEpsCs2uNw7miT27P9UIscKSwYrFlvcbprt-l2claLv4bMyHlNg1e9d_7Rt43UCaCYOeBp1Ycy08TasGzzkms5dbUDQ";
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
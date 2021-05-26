const fetch = require('node-fetch');
const constants = require('./constants');



const loadLibrary = async(tokens, io, sessionId) => {

    let items = {};




    for (var i = 0; i < tokens.length; i++) {
        const token = tokens[i];

        var url = `${constants.SPOTIFY_BASE_URL}/me/tracks?offset=0&limit=50`;


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
                newItems.forEach(element => { //save each to map if doesnt exist
                    items[element.track.id] = element.track;
                });
                url = json.next;
                const message = `tracks ${json.offset}/${json.total} for user ${i + 1}/${tokens.length}`;
                console.log(message + " " + sessionId);

                io.to(sessionId).emit('SESSION_LOADED', { "message": message });

            } catch (er) {
                console.log("FAILED LOADING SOME DATA");

                url = null;
                console.log(er);
                io.to(sessionId).emit('SESSION_LOADED', { "message": "FAILED TO LOAD SOME DATA" });

                continue;
            }
            if (count > 3) {
                break; //TODO: remove to allow full thing to happen
            }
            count++;
        }

    }


    let itemArray = Object.values(items);
    console.log("completed with " + Object.keys(items).length + " length");
    io.to(sessionId).emit('SESSION_LOADED', { "message": `${Object.keys(items).length} similar songs`, data: itemArray.slice(0, 25) });
    return itemArray;

}

const test = async(req, res) => {
    console.log("test");
    const token = "BQBKp6ISVRzEMkm9GQLpWbedRzl7QNHsBz5_4Pf9nKDJw7gHzLJONUgIpR7IUWjQP6CZGzNpGjfs81gSmAA5uN8p3RltttnJKxqeJbtTxJ3fzSqOyf5WvhfgRp3ApZYhOCvqY9K594gWAaLfAchC_43Hw0XiU1E7OaRWnZXCVVc";
    let t = await loadLibrary([token]);
    res.json(t);
}

exports.test = test;
exports.loadLibrary = loadLibrary;
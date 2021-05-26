const nanoid = require('nanoid');
const path = require('path');
const querystring = require('querystring');

//choose if creating room or joining room
const chooseRoom = (req, res) => {
    const filepath = __dirname + "/../app/pages/choose-room.html";
    res.sendFile(path.resolve(filepath));
}

//create room if we have active token
const createRoom = (req, res) => {
    const roomID = nanoid.nanoid(6).toUpperCase();
    console.log(roomID);
    const token = req.query.access_token;
    const refreshToken = req.query.refresh_token;
    console.log(token);
    if (!token || !refreshToken) {
        res.redirect('/?' +
            querystring.stringify({
                error: 'invalid_token'
            }));
        return;
    }
    res.redirect('/app/' + roomID);
}


//active room
const activeRoom = (req, res) => {
    res.json({ activeRoom: 'activeRoom' });
}

//active room
const joinRoom = (req, res) => {
    const filepath = __dirname + "/../app/pages/join-room.html";
    res.sendFile(path.resolve(filepath));
}



//home
const home = (req, res) => {
    const filepath = __dirname + "/../app/pages/index.html";
    res.sendFile(path.resolve(filepath));
}

exports.chooseRoom = chooseRoom;
exports.createRoom = createRoom;
exports.activeRoom = activeRoom;
exports.joinRoom = joinRoom;
exports.home = home;
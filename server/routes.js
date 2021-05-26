const uuid = require('uuid');
const path = require('path');

//choose if creating room or joining room
const chooseRoom = (req, res) => {
    const filepath = __dirname + "/../app/pages/choose-room.html";
    res.sendFile(path.resolve(filepath));
}

//create room
const createRoom = (req, res) => {
    res.json({ createRoom: 'createRoom' });
}


//active room
const activeRoom = (req, res) => {
        res.json({ activeRoom: 'activeRoom' });
    }
    //active room
const joinRoom = (req, res) => {
    res.json({ joinRoom: 'joinRoom' });
}


exports.chooseRoom = chooseRoom;
exports.createRoom = createRoom;
exports.activeRoom = activeRoom;
exports.joinRoom = joinRoom;
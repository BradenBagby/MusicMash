const express = require('express');
const bodyParser = require('body-parser');
const http = require('http');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const constants = require('./constants');
const routes = require('./routes');
const path = require('path');
const socket = require('./socket');
const spotify = require('./spotify')

const auth = require('./auth')


const app = express();
const server = http.createServer(app);

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

//TODO: get rid of this
app.use(cors());
app.options('*', cors());

app.use(cookieParser());

///spotify auth
app.get('/spotify', auth.initAuth);
app.get('/authResult', auth.authCallback);

//app
app.get('/app/', routes.chooseRoom);
app.get('/app/create', routes.createRoom);
app.get('/app/join', routes.joinRoom);
app.get('/app/:id', routes.activeRoom);
app.get('/', routes.home);
app.use('/app/active', express.static(path.resolve(__dirname + "/../app/flutter-web-app/music_mash/build/web/")))

app.get('/test', spotify.test);

app.get('/api/mash/:id', socket.getMashPage);
app.get('/api/name', spotify.name);


//resources
app.use('/resources', express.static(path.resolve(__dirname + "/../app/pages/resources/")))

//socket
socket.createSocket(server);

server.listen(constants.PORT, () => {
    console.log("listening: " + constants.PORT);
});
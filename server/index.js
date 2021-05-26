const express = require('express');
const bodyParser = require('body-parser');
const http = require('http');
const cors = require('cors');
const cookieParser = require('cookie-parser');
const constants = require('./constants');

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


server.listen(constants.PORT, () => {
    console.log("listening: " + constants.PORT);
});
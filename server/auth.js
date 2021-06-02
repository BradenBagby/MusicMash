///This file was made easy thanks to Spotify's example https://github.com/spotify/web-api-auth-examples/blob/master/authorization_code/app.js

const constants = require('./constants');
var querystring = require('querystring');
const secrets = require('./secrets') //not on github sorry :)
var request = require('request');

const generateRandomString = function(length) {
    var text = '';
    var possible = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';

    for (var i = 0; i < length; i++) {
        text += possible.charAt(Math.floor(Math.random() * possible.length));
    }
    return text;
};



//send user to authenticate with spotify
const initAuth = (req, res) => {

    var state = generateRandomString(16);
    res.cookie(constants.SPOTIFY_STATE_KEY, state);
    res.clearCookie(constants.SPOTIFY_REFRESH_TOKEN_KEY);
    res.clearCookie(constants.SPOTIFY_TOKEN_KEY);

    var scopes = 'user-read-private user-library-read playlist-read-private';
    res.redirect('https://accounts.spotify.com/authorize?' +
        querystring.stringify({
            response_type: 'code',
            client_id: secrets.CLIENT_ID,
            scope: scopes,
            redirect_uri: constants.REDIRECT_URI,
            state: state
        }));
}

//handle result from user's authentication
const authCallback = (req, res) => {
    var code = req.query.code || null;
    var state = req.query.state || null;
    var storedState = req.cookies ? req.cookies[constants.SPOTIFY_STATE_KEY] : null;

    //gaurd
    if (state === null || state !== storedState) {
        res.redirect('/?' +
            querystring.stringify({
                error: 'state_mismatch'
            }));
        return;
    }
    res.clearCookie(constants.SPOTIFY_STATE_KEY);

    //prepare request to get token from code
    var authOptions = {
        url: 'https://accounts.spotify.com/api/token',
        form: {
            code: code,
            redirect_uri: constants.REDIRECT_URI,
            grant_type: 'authorization_code'
        },
        headers: {
            'Authorization': 'Basic ' + (Buffer.from(secrets.CLIENT_ID + ':' + secrets.CLIENT_SECRET).toString('base64'))
        },
        json: true
    };

    //perform request
    request.post(authOptions, function(error, response, body) {

        //gaurd
        if (error || response.statusCode != 200) {
            res.redirect('/?' +
                querystring.stringify({
                    error: 'invalid_token'
                }));
            return;
        }

        const access_token = body.access_token;
        const refresh_token = body.refresh_token;

        //save tokens as cookies (yum)
        res.cookie(constants.SPOTIFY_TOKEN_KEY, access_token);
        res.cookie(constants.SPOTIFY_REFRESH_TOKEN_KEY, refresh_token);

        //redirect to web app, we are now ready for the fun stuff
        res.redirect('/app?' +
            querystring.stringify({
                access_token: access_token,
                refresh_token: refresh_token
            }));
    });
}


exports.initAuth = initAuth;
exports.authCallback = authCallback;
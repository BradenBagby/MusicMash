const PORT = 7788;

module.exports = Object.freeze({
    PORT: PORT,
    REDIRECT_URI: `https://musicmash.app/authResult`,
    //  `http://localhost:7788/authResult`, //` // //`http://ec2-3-142-189-223.us-east-2.compute.amazonaws.com/authResult`, //, //, //, //, //, //,`http://localhost:7788/authResult`,
    SPOTIFY_STATE_KEY: 'spotify_auth_state',
    SPOTIFY_TOKEN_KEY: 'spotify_auth_token',
    SPOTIFY_REFRESH_TOKEN_KEY: 'spotify_auth_refresh_token',
    SPOTIFY_BASE_URL: "https://api.spotify.com/v1"
});
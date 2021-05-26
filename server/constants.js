const PORT = 7788;

module.exports = Object.freeze({
    PORT: PORT,
    REDIRECT_URI: `http://localhost:${PORT}/authResult`,
    SPOTIFY_STATE_KEY: 'spotify_auth_state',
    SPOTIFY_TOKEN_KEY: 'spotify_auth_token',
    SPOTIFY_REFRESH_TOKEN_KEY: 'spotify_auth_refresh_token',
    SPOTIFY_BASE_URL: "https://api.spotify.com/v1"
});
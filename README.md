# Music Mash

Music Mash allows you to see which music you and your friends have in common

## Overview

### Back end 
See server directory. Uses express and socket.io to handle communication with APIs/front end

### Front end
Uses raw js/html/css + bootstrap in files under pages directory. <br>
Once user is signed in and has Spotify access token, the rest of the app is built with Dart + the Flutter framework under app/flutter-web-app/music_mash. Because I did not want to install flutter framework on the server, the build directory is also included in the commit

### Sorry

This app was created in under 48 hours for a special work day. The code is not as organized or clean as it should be because speed and completing in time was top priority. <br>

Final commit in short time frame: 56eb748..8f39683
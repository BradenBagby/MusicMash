const socket = require('socket.io');
const spotify = require('./spotify');

var sessions = {}; // sessionId:[token]
var connections = {}; // socketId:session
var mashes = {}; //sessionId : mashObject



const sessionUpdated = (socket, sessionId) => {
    console.log("emit session updated: " + sessionId);
    socket.in(sessionId).emit('session', sessions[sessionId]);
}

const createSocket = (server) => {

    const io = socket(server, {
        path: '/api/io',
    });


    io.on('connection', (socket) => {
        console.log("got a connection");
        const connectionId = String(socket.id);


        ///handle receiving token and session ID
        socket.on('token', ({ token, sessionId, name }) => {
            console.log(`got token: ${token} session id: ${sessionId}`);

            if (sessionId in mashes) { //mash has already happended for this session
                socket.emit('sessionDone');
                return;
            }



            //store under sessions 
            if (!(sessionId in sessions)) {
                sessions[sessionId] = [];
            }

            //remove dups for now. this was happening beause of hot-reload in flutter. multipole socket connections for one person
            //sessions[sessionId] = sessions[sessionId].filter(function(el) { return el.token != token; });

            sessions[sessionId].push({ id: connectionId, token: token, name: name });


            //store under connecttions so we can clean up
            connections[String(connectionId)] = sessionId;


            //subscribe socket to sessionId room
            socket.join(sessionId);
            socket.emit('session', sessions[sessionId]);
            sessionUpdated(socket, sessionId);

        });
        socket.on('startMash', ({ sessionId }) => {
            console.log("start mash for session: " + sessionId);

            //get all tokens
            var tokens = [];
            let session = sessions[sessionId];
            session.forEach(element => {
                tokens.push(element.token);
            });
            console.log(`all tokens: ${tokens}`)
            spotify.loadLibrary(tokens, socket, sessionId);

            socket.in(sessionId).emit('SESSION_LOADED', {
                message: 'start'
            });
        });

        ///handle disconnect
        socket.on('disconnect', () => { //remove and cleanup session if needed
            let existingSessionId = connections[connectionId];
            console.log("disconnected from session: " + existingSessionId + " with my id: " + connectionId);
            if (existingSessionId) {

                //remove user from session
                let session = sessions[existingSessionId];
                console.log(session);
                session = session.filter(function(el) { return String(el.id) != String(connectionId); });
                sessions[existingSessionId] = session;

                //remove session if its the last one
                if (session.length < 1) {
                    delete sessions[existingSessionId];
                }

                sessionUpdated(socket, existingSessionId);
            }

            //remove connection
            if (connectionId in connections) {
                delete connections[connectionId];
            }
        });
    });

};

exports.createSocket = createSocket;



setInterval(() => {
    console.log("sessions: ")
    console.log(sessions);
    console.log("connections: ")
    console.log(connections);
    console.log("-----")
}, 10000);
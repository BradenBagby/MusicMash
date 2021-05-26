const socket = require('socket.io');

var sessions = {}; // sessionId:[token]
var connections = {}; // socketId:session



const createSocket = (server) => {

    const io = socket(server, {
        path: '/api/io',
    });


    io.on('connection', (socket) => {
        console.log("got a connection");
        const connectionId = socket.id;


        ///handle receiving token and session ID
        socket.on('token', ({ token, sessionId, name }) => {
            console.log(`got token: ${token} session id: ${sessionId}`);

            //store under connecttions so we can clean up
            connections[connectionId] = sessionId;

            //store under sessions 
            if (!(sessionId in sessions)) {
                sessions[sessionId] = [];
            }
            sessions[sessionId].push({ id: connectionId, token: token, name: name });


            //subscribe socket to sessionId room
            socket.join(sessionId);
            socket.in(sessionId).emit('session', sessions[sessionId]);
        });

        ///handle disconnect
        socket.on('disconnect', () => { //remove and cleanup session if needed
            let existingSessionId = connections[connectionId];
            if (existingSessionId) {

                //remove user from session
                let session = sessions[existingSessionId];
                console.log(session);
                session = session.filter(function(el) { return el.id != connectionId; });

                //remove session if its the last one
                if (session.length < 1) {
                    delete sessions[existingSessionId];
                }
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
}, 3000);
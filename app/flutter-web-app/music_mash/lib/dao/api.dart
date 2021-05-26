import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:music_mash/domain/track/spotify_track.dart';
import 'package:music_mash/utilities/constants.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class Api {
  static const BASE_URL = "${Constants.HOST}";
  static StreamController _sessionDataStreamController =
      StreamController<Map<String, dynamic>>.broadcast();
  static Stream get sessionDataStream => _sessionDataStreamController.stream;

  static late io.Socket socket;

  static final BaseOptions options = BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );

  static final Dio dio = Dio(options);

  static Future<void> startMash(String sessionId) async {
    _sessionDataStreamController.sink.add({"type": "SESSION_START"});
    socket.emit('startMash', [
      {'sessionId': sessionId}
    ]);
    log("emit start mash: $sessionId ");
  }

  static Future<List<SpotifyTrack>> loadMoreTracks(String sessionId,
      {required int offset, required int amount}) async {
    final url = Constants.HOST +
        '/api/mash/${sessionId}/?size=${amount}&offset=${offset}';

    final res = await dio.get(url);

    if (res.statusCode != 200 || res.data == null) {
      throw Exception();
    }
    final data = List<Map<String, dynamic>>.from(res.data as Iterable<dynamic>);
    final tracks = data.map((e) => SpotifyTrack.fromJson(e)).toList();
    return tracks;
  }

  static Future<bool> connect(
      String sessionId, String token, String name) async {
    socket = io.io(
      BASE_URL,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .setPath('/api/io')
          .build(),
    );
    final completer = Completer<bool>();

    socket.onConnect((data) {
      log("SOCKET! Connected");
      if (completer.isCompleted == false) {
        completer.complete(true);
      }
      final Map<String, dynamic> data = {
        "token": token,
        "sessionId": sessionId,
        "name": name
      };
      socket.emit('token', [data]);

      log("Sent token $token");
    });

    socket.onConnectError((data) {
      log("SOCKET! errored $data");
      if (completer.isCompleted == false) completer.complete(false);
    });

    socket.onDisconnect((data) {
      log("SOCKET! disconnected");
    });

    socket.on('SESSION_LOADED', (data) {
      _sessionDataStreamController
          .add({"type": "SESSION_LOADED", "data": data});
    });

    socket.on('SESSION_DONE', (data) {
      _sessionDataStreamController.add({"type": "SESSION_DONE"});
      socket.disconnect();
    });

    socket.on('session', (data) {
      log("got session DATA");
      _sessionDataStreamController.add({"type": "SESSION_DATA", "data": data});
    });

    log("SOCKET! built socket");
    socket.connect();

    return completer.future;
  }
}

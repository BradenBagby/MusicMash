import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_mash/dao/api.dart';
import 'package:music_mash/domain/track/spotify_track.dart';
import 'package:music_mash/domain/user/session_user.dart';
import 'package:music_mash/utilities/alerts.dart';
import 'package:music_mash/utilities/route_controller.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

class RoomCubit extends Cubit<RoomState> {
  RoomCubit() : super(RoomState()) {
    Api.sessionDataStream.listen((event) {
      final type = event['type'];
      if (type == null) {
        return;
      }
      if (type == 'SESSION_DONE') {
        Alerts.ok(
            message: "This room has already started mashing music :(",
            context: RouteController.key.currentContext!);
        start();
        return;
      } else if (type == 'SESSION_DATA') {
        log("SESSION UPDATED");
        final data = event["data"] as List<dynamic>;
        final users = data
            .map((e) => SessionUser.fromJson(
                Map<String, dynamic>.from(e as Map<dynamic, dynamic>)))
            .toList();
        usersUpdated(users);
      } else if (type == "SESSION_START") {
        emit(state.copyWith(mashing: true));
      } else if (type == 'SESSION_LOADED') {
        final data = event['data'];
        final message = data['message'];
        final tracks = data['data'];
        if (tracks == null) {
          emit(state.copyWith(mashingMessage: message as String));
        } else {
          final realData =
              List<Map<String, dynamic>>.from(tracks as Iterable<dynamic>);
          final realTracks =
              realData.map((e) => SpotifyTrack.fromJson(e)).toList();
          emit(state.copyWith(
              mashingMessage: message as String, tracks: realTracks));
        }
      }
    });
  }

  void start() {
    log("ROOM CUBIT START");
    //TODO: actually get the name
    final name = "BB";
    final sessionId = "sessionId"; //TOOD: get session ID from url
    final token =
        "BQCeaJnZgz-thonpL7tbsRZpsjZSAOOkM1P6rmALzu_15OsPSP_iFpw-f-TxrsZon7hEeJGIaxEXSmNX6qr4dFH5BoEg6h2z3Xcw9ZkinXUHHJnwqUXJKATj7H21vIdCfn83fb41cL6UJN8YCgGIsNyaJJloM4rWDgsZa8M8Zwg";
    emit(state.copyWith(
        name: name,
        users: [],
        connected: false,
        sessionId: sessionId,
        mashingMessage: "",
        tracks: [],
        mashing: false));
    Api.connect(sessionId, token, name);
  }

  void usersUpdated(List<SessionUser> users) {
    emit(state.copyWith(users: users));
  }
}

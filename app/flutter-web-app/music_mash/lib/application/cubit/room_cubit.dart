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
      } else if (type == 'SESSION_DATA') {
        final message = event['message'];
        final tracks = event['data'];
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
        "BQBKp6ISVRzEMkm9GQLpWbedRzl7QNHsBz5_4Pf9nKDJw7gHzLJONUgIpR7IUWjQP6CZGzNpGjfs81gSmAA5uN8p3RltttnJKxqeJbtTxJ3fzSqOyf5WvhfgRp3ApZYhOCvqY9K594gWAaLfAchC_43Hw0XiU1E7OaRWnZXCVVc";
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

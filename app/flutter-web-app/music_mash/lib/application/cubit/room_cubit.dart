import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_mash/dao/api.dart';
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
      }
    });
  }

  void start() {
    log("ROOM CUBIT START");
    //TODO: actually get the name
    final name = "BB";
    final sessionId = "sessionId"; //TOOD: get session ID from url
    emit(state.copyWith(
        name: name,
        users: [],
        connected: false,
        sessionId: sessionId,
        mashing: false));
    Api.connect(sessionId, "token", name);
  }

  void usersUpdated(List<SessionUser> users) {
    emit(state.copyWith(users: users));
  }
}

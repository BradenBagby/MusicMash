import 'dart:developer';
import 'package:js/js.dart';
import 'package:flutter/foundation.dart';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_mash/dao/api.dart';
import 'package:music_mash/domain/track/spotify_track.dart';
import 'package:music_mash/domain/user/session_user.dart';
import 'package:music_mash/utilities/alerts.dart';
import 'package:music_mash/utilities/constants.dart';
import 'package:music_mash/utilities/route_controller.dart';

part 'room_state.dart';
part 'room_cubit.freezed.dart';

@JS('window.location.href')
external String href;

@JS('goHome()')
external void goHome();

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
              mashingMessage: message as String,
              tracks: realTracks,
              loadedOffset: tracks.length,
              hasMore: tracks.length ==
                  25)); //because ouur server returns 25 initially
        }
      }
    });
  }

  void start() {
    log("ROOM CUBIT START");
    //TODO: actually get the name
    emit(RoomState());

    final name = "BB";

    final uri = Uri.tryParse(href);
    final queryParams = uri?.queryParameters;
    final sessionId = queryParams?['sessionId'];
    var token = queryParams?['access_token'];
    log("found href");
    log(href);
    //   queryParams['access_token'];

    if (sessionId == null || token == null) {
      log("go home");
      if (kReleaseMode) {
        goHome();
      } else {
        token =
            "BQBrLyS1DRbSl-49QrLX23MQeKzPcubdWNVwKlGWP2PRNluFxNb8LZ7nuyn0KnXIxQd58sTmAcsJ2tIjT0XDfxfpbATClRKJuOWsR7s7YJKhYnRzyABCZEDu9Dizvkt_Yo7YXx_v4rGN9WKw16cEe-4uNZ9SC0gd6cNZ4CRiEJM";
      }
    }

    //  "BQBuy0d9XjZ3LJZZwXb7_jZobTo_eC3JLQgcvJz1fZn002WGNPb0mmME3YKT3fZ5FQAhYwB_guw5ud9IiMrZLtX3pY_4mmAJJJUQAWsFEkXqUMTeF_cvLW3Pn5MtAQ0CKc1R2uxfFZ_PlPBw0VuEQwTqGIS3vEg7A9cHdvJpufo";
    emit(state.copyWith(
      name: name,
      connected: false,
      sessionId: sessionId ?? "sessionDefault",
    ));
    Api.connect(sessionId ?? "sessionDefault", token ?? "errorToken", name);
  }

  void usersUpdated(List<SessionUser> users) {
    emit(state.copyWith(users: users));
  }

  void loadMore() async {
    try {
      final offset = state.loadedOffset;
      final amount = 25;
      emit(state.copyWith(loadingMore: true));
      final newTracks = await Api.loadMoreTracks(state.sessionId,
          offset: offset, amount: amount);
      final allTracks = List<SpotifyTrack>.from(state.tracks);
      allTracks.addAll(newTracks);
      emit(state.copyWith(
          loadingMore: false,
          error: "",
          hasMore: newTracks.length == amount,
          loadedOffset: offset + newTracks.length,
          tracks: allTracks));
    } catch (er) {
      emit(state.copyWith(
          error: "Failed to load more tracks", loadingMore: false));
    }
  }
}

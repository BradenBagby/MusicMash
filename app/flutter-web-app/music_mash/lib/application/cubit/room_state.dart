part of 'room_cubit.dart';

@freezed
abstract class RoomState with _$RoomState {
  const factory RoomState(
      {@Default(false) bool connected,
      @Default([]) List<SessionUser> users,
      @Default("") String sessionId,
      @Default("Anonymous") String name,
      @Default("") String mashingMessage,
      @Default([]) List<SpotifyTrack> tracks,
      @Default(false) bool mashing}) = _RoomState;
}

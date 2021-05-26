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
      @Default(0) int loadedOffset,
      @Default(false) bool hasMore,
      @Default("") String error,
      @Default(false) bool loadingMore,
      @Default(false) bool mashing}) = _RoomState;
}

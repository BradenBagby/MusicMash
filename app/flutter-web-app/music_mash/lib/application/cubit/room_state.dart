part of 'room_cubit.dart';

@freezed
abstract class RoomState with _$RoomState {
  const factory RoomState(
      {@Default(false) bool connected,
      @Default([]) List<SessionUser> users,
      @Default("") String sessionId,
      @Default("Anonymous") String name,
      @Default(false) bool mashing}) = _RoomState;
}

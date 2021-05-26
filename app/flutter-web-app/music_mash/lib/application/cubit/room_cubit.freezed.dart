// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'room_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RoomStateTearOff {
  const _$RoomStateTearOff();

  _RoomState call(
      {bool connected = false,
      List<SessionUser> users = const [],
      String sessionId = "",
      String name = "Anonymous",
      bool mashing = false}) {
    return _RoomState(
      connected: connected,
      users: users,
      sessionId: sessionId,
      name: name,
      mashing: mashing,
    );
  }
}

/// @nodoc
const $RoomState = _$RoomStateTearOff();

/// @nodoc
mixin _$RoomState {
  bool get connected => throw _privateConstructorUsedError;
  List<SessionUser> get users => throw _privateConstructorUsedError;
  String get sessionId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  bool get mashing => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RoomStateCopyWith<RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomStateCopyWith<$Res> {
  factory $RoomStateCopyWith(RoomState value, $Res Function(RoomState) then) =
      _$RoomStateCopyWithImpl<$Res>;
  $Res call(
      {bool connected,
      List<SessionUser> users,
      String sessionId,
      String name,
      bool mashing});
}

/// @nodoc
class _$RoomStateCopyWithImpl<$Res> implements $RoomStateCopyWith<$Res> {
  _$RoomStateCopyWithImpl(this._value, this._then);

  final RoomState _value;
  // ignore: unused_field
  final $Res Function(RoomState) _then;

  @override
  $Res call({
    Object? connected = freezed,
    Object? users = freezed,
    Object? sessionId = freezed,
    Object? name = freezed,
    Object? mashing = freezed,
  }) {
    return _then(_value.copyWith(
      connected: connected == freezed
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<SessionUser>,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mashing: mashing == freezed
          ? _value.mashing
          : mashing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$RoomStateCopyWith<$Res> implements $RoomStateCopyWith<$Res> {
  factory _$RoomStateCopyWith(
          _RoomState value, $Res Function(_RoomState) then) =
      __$RoomStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool connected,
      List<SessionUser> users,
      String sessionId,
      String name,
      bool mashing});
}

/// @nodoc
class __$RoomStateCopyWithImpl<$Res> extends _$RoomStateCopyWithImpl<$Res>
    implements _$RoomStateCopyWith<$Res> {
  __$RoomStateCopyWithImpl(_RoomState _value, $Res Function(_RoomState) _then)
      : super(_value, (v) => _then(v as _RoomState));

  @override
  _RoomState get _value => super._value as _RoomState;

  @override
  $Res call({
    Object? connected = freezed,
    Object? users = freezed,
    Object? sessionId = freezed,
    Object? name = freezed,
    Object? mashing = freezed,
  }) {
    return _then(_RoomState(
      connected: connected == freezed
          ? _value.connected
          : connected // ignore: cast_nullable_to_non_nullable
              as bool,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<SessionUser>,
      sessionId: sessionId == freezed
          ? _value.sessionId
          : sessionId // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      mashing: mashing == freezed
          ? _value.mashing
          : mashing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
class _$_RoomState implements _RoomState {
  const _$_RoomState(
      {this.connected = false,
      this.users = const [],
      this.sessionId = "",
      this.name = "Anonymous",
      this.mashing = false});

  @JsonKey(defaultValue: false)
  @override
  final bool connected;
  @JsonKey(defaultValue: const [])
  @override
  final List<SessionUser> users;
  @JsonKey(defaultValue: "")
  @override
  final String sessionId;
  @JsonKey(defaultValue: "Anonymous")
  @override
  final String name;
  @JsonKey(defaultValue: false)
  @override
  final bool mashing;

  @override
  String toString() {
    return 'RoomState(connected: $connected, users: $users, sessionId: $sessionId, name: $name, mashing: $mashing)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RoomState &&
            (identical(other.connected, connected) ||
                const DeepCollectionEquality()
                    .equals(other.connected, connected)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)) &&
            (identical(other.sessionId, sessionId) ||
                const DeepCollectionEquality()
                    .equals(other.sessionId, sessionId)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.mashing, mashing) ||
                const DeepCollectionEquality().equals(other.mashing, mashing)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(connected) ^
      const DeepCollectionEquality().hash(users) ^
      const DeepCollectionEquality().hash(sessionId) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(mashing);

  @JsonKey(ignore: true)
  @override
  _$RoomStateCopyWith<_RoomState> get copyWith =>
      __$RoomStateCopyWithImpl<_RoomState>(this, _$identity);
}

abstract class _RoomState implements RoomState {
  const factory _RoomState(
      {bool connected,
      List<SessionUser> users,
      String sessionId,
      String name,
      bool mashing}) = _$_RoomState;

  @override
  bool get connected => throw _privateConstructorUsedError;
  @override
  List<SessionUser> get users => throw _privateConstructorUsedError;
  @override
  String get sessionId => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  bool get mashing => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$RoomStateCopyWith<_RoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

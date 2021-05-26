// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'session_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SessionUser _$SessionUserFromJson(Map<String, dynamic> json) {
  return _SessionUser.fromJson(json);
}

/// @nodoc
class _$SessionUserTearOff {
  const _$SessionUserTearOff();

  _SessionUser call({required String name, required String id}) {
    return _SessionUser(
      name: name,
      id: id,
    );
  }

  SessionUser fromJson(Map<String, Object> json) {
    return SessionUser.fromJson(json);
  }
}

/// @nodoc
const $SessionUser = _$SessionUserTearOff();

/// @nodoc
mixin _$SessionUser {
  String get name => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionUserCopyWith<SessionUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionUserCopyWith<$Res> {
  factory $SessionUserCopyWith(
          SessionUser value, $Res Function(SessionUser) then) =
      _$SessionUserCopyWithImpl<$Res>;
  $Res call({String name, String id});
}

/// @nodoc
class _$SessionUserCopyWithImpl<$Res> implements $SessionUserCopyWith<$Res> {
  _$SessionUserCopyWithImpl(this._value, this._then);

  final SessionUser _value;
  // ignore: unused_field
  final $Res Function(SessionUser) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SessionUserCopyWith<$Res>
    implements $SessionUserCopyWith<$Res> {
  factory _$SessionUserCopyWith(
          _SessionUser value, $Res Function(_SessionUser) then) =
      __$SessionUserCopyWithImpl<$Res>;
  @override
  $Res call({String name, String id});
}

/// @nodoc
class __$SessionUserCopyWithImpl<$Res> extends _$SessionUserCopyWithImpl<$Res>
    implements _$SessionUserCopyWith<$Res> {
  __$SessionUserCopyWithImpl(
      _SessionUser _value, $Res Function(_SessionUser) _then)
      : super(_value, (v) => _then(v as _SessionUser));

  @override
  _SessionUser get _value => super._value as _SessionUser;

  @override
  $Res call({
    Object? name = freezed,
    Object? id = freezed,
  }) {
    return _then(_SessionUser(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SessionUser implements _SessionUser {
  _$_SessionUser({required this.name, required this.id});

  factory _$_SessionUser.fromJson(Map<String, dynamic> json) =>
      _$_$_SessionUserFromJson(json);

  @override
  final String name;
  @override
  final String id;

  @override
  String toString() {
    return 'SessionUser(name: $name, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SessionUser &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(id);

  @JsonKey(ignore: true)
  @override
  _$SessionUserCopyWith<_SessionUser> get copyWith =>
      __$SessionUserCopyWithImpl<_SessionUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SessionUserToJson(this);
  }
}

abstract class _SessionUser implements SessionUser {
  factory _SessionUser({required String name, required String id}) =
      _$_SessionUser;

  factory _SessionUser.fromJson(Map<String, dynamic> json) =
      _$_SessionUser.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SessionUserCopyWith<_SessionUser> get copyWith =>
      throw _privateConstructorUsedError;
}

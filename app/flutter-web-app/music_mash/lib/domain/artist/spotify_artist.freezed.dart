// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'spotify_artist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpotifyArtist _$SpotifyArtistFromJson(Map<String, dynamic> json) {
  return _SpotifyArtist.fromJson(json);
}

/// @nodoc
class _$SpotifyArtistTearOff {
  const _$SpotifyArtistTearOff();

  _SpotifyArtist call(
      {required String href,
      required String id,
      required String name,
      required String type,
      required String uri}) {
    return _SpotifyArtist(
      href: href,
      id: id,
      name: name,
      type: type,
      uri: uri,
    );
  }

  SpotifyArtist fromJson(Map<String, Object> json) {
    return SpotifyArtist.fromJson(json);
  }
}

/// @nodoc
const $SpotifyArtist = _$SpotifyArtistTearOff();

/// @nodoc
mixin _$SpotifyArtist {
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpotifyArtistCopyWith<SpotifyArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotifyArtistCopyWith<$Res> {
  factory $SpotifyArtistCopyWith(
          SpotifyArtist value, $Res Function(SpotifyArtist) then) =
      _$SpotifyArtistCopyWithImpl<$Res>;
  $Res call({String href, String id, String name, String type, String uri});
}

/// @nodoc
class _$SpotifyArtistCopyWithImpl<$Res>
    implements $SpotifyArtistCopyWith<$Res> {
  _$SpotifyArtistCopyWithImpl(this._value, this._then);

  final SpotifyArtist _value;
  // ignore: unused_field
  final $Res Function(SpotifyArtist) _then;

  @override
  $Res call({
    Object? href = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SpotifyArtistCopyWith<$Res>
    implements $SpotifyArtistCopyWith<$Res> {
  factory _$SpotifyArtistCopyWith(
          _SpotifyArtist value, $Res Function(_SpotifyArtist) then) =
      __$SpotifyArtistCopyWithImpl<$Res>;
  @override
  $Res call({String href, String id, String name, String type, String uri});
}

/// @nodoc
class __$SpotifyArtistCopyWithImpl<$Res>
    extends _$SpotifyArtistCopyWithImpl<$Res>
    implements _$SpotifyArtistCopyWith<$Res> {
  __$SpotifyArtistCopyWithImpl(
      _SpotifyArtist _value, $Res Function(_SpotifyArtist) _then)
      : super(_value, (v) => _then(v as _SpotifyArtist));

  @override
  _SpotifyArtist get _value => super._value as _SpotifyArtist;

  @override
  $Res call({
    Object? href = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_SpotifyArtist(
      href: href == freezed
          ? _value.href
          : href // ignore: cast_nullable_to_non_nullable
              as String,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      uri: uri == freezed
          ? _value.uri
          : uri // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_SpotifyArtist implements _SpotifyArtist {
  _$_SpotifyArtist(
      {required this.href,
      required this.id,
      required this.name,
      required this.type,
      required this.uri});

  factory _$_SpotifyArtist.fromJson(Map<String, dynamic> json) =>
      _$_$_SpotifyArtistFromJson(json);

  @override
  final String href;
  @override
  final String id;
  @override
  final String name;
  @override
  final String type;
  @override
  final String uri;

  @override
  String toString() {
    return 'SpotifyArtist(href: $href, id: $id, name: $name, type: $type, uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpotifyArtist &&
            (identical(other.href, href) ||
                const DeepCollectionEquality().equals(other.href, href)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.uri, uri) ||
                const DeepCollectionEquality().equals(other.uri, uri)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(href) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(uri);

  @JsonKey(ignore: true)
  @override
  _$SpotifyArtistCopyWith<_SpotifyArtist> get copyWith =>
      __$SpotifyArtistCopyWithImpl<_SpotifyArtist>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpotifyArtistToJson(this);
  }
}

abstract class _SpotifyArtist implements SpotifyArtist {
  factory _SpotifyArtist(
      {required String href,
      required String id,
      required String name,
      required String type,
      required String uri}) = _$_SpotifyArtist;

  factory _SpotifyArtist.fromJson(Map<String, dynamic> json) =
      _$_SpotifyArtist.fromJson;

  @override
  String get href => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get uri => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SpotifyArtistCopyWith<_SpotifyArtist> get copyWith =>
      throw _privateConstructorUsedError;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'spotify_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SpotifyTrack _$SpotifyTrackFromJson(Map<String, dynamic> json) {
  return _SpotifyTrack.fromJson(json);
}

/// @nodoc
class _$SpotifyTrackTearOff {
  const _$SpotifyTrackTearOff();

  _SpotifyTrack call(
      {List<SpotifyArtist> artists = const [],
      required int duration_ms,
      required bool explicit,
      required String href,
      required String id,
      required String name,
      int popularity = 0,
      String? preview_url,
      required String type,
      required String uri}) {
    return _SpotifyTrack(
      artists: artists,
      duration_ms: duration_ms,
      explicit: explicit,
      href: href,
      id: id,
      name: name,
      popularity: popularity,
      preview_url: preview_url,
      type: type,
      uri: uri,
    );
  }

  SpotifyTrack fromJson(Map<String, Object> json) {
    return SpotifyTrack.fromJson(json);
  }
}

/// @nodoc
const $SpotifyTrack = _$SpotifyTrackTearOff();

/// @nodoc
mixin _$SpotifyTrack {
  List<SpotifyArtist> get artists => throw _privateConstructorUsedError;
  int get duration_ms => throw _privateConstructorUsedError;
  bool get explicit => throw _privateConstructorUsedError;
  String get href => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get popularity => throw _privateConstructorUsedError;
  String? get preview_url => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get uri => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpotifyTrackCopyWith<SpotifyTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpotifyTrackCopyWith<$Res> {
  factory $SpotifyTrackCopyWith(
          SpotifyTrack value, $Res Function(SpotifyTrack) then) =
      _$SpotifyTrackCopyWithImpl<$Res>;
  $Res call(
      {List<SpotifyArtist> artists,
      int duration_ms,
      bool explicit,
      String href,
      String id,
      String name,
      int popularity,
      String? preview_url,
      String type,
      String uri});
}

/// @nodoc
class _$SpotifyTrackCopyWithImpl<$Res> implements $SpotifyTrackCopyWith<$Res> {
  _$SpotifyTrackCopyWithImpl(this._value, this._then);

  final SpotifyTrack _value;
  // ignore: unused_field
  final $Res Function(SpotifyTrack) _then;

  @override
  $Res call({
    Object? artists = freezed,
    Object? duration_ms = freezed,
    Object? explicit = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? popularity = freezed,
    Object? preview_url = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_value.copyWith(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<SpotifyArtist>,
      duration_ms: duration_ms == freezed
          ? _value.duration_ms
          : duration_ms // ignore: cast_nullable_to_non_nullable
              as int,
      explicit: explicit == freezed
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool,
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
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
      preview_url: preview_url == freezed
          ? _value.preview_url
          : preview_url // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$SpotifyTrackCopyWith<$Res>
    implements $SpotifyTrackCopyWith<$Res> {
  factory _$SpotifyTrackCopyWith(
          _SpotifyTrack value, $Res Function(_SpotifyTrack) then) =
      __$SpotifyTrackCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<SpotifyArtist> artists,
      int duration_ms,
      bool explicit,
      String href,
      String id,
      String name,
      int popularity,
      String? preview_url,
      String type,
      String uri});
}

/// @nodoc
class __$SpotifyTrackCopyWithImpl<$Res> extends _$SpotifyTrackCopyWithImpl<$Res>
    implements _$SpotifyTrackCopyWith<$Res> {
  __$SpotifyTrackCopyWithImpl(
      _SpotifyTrack _value, $Res Function(_SpotifyTrack) _then)
      : super(_value, (v) => _then(v as _SpotifyTrack));

  @override
  _SpotifyTrack get _value => super._value as _SpotifyTrack;

  @override
  $Res call({
    Object? artists = freezed,
    Object? duration_ms = freezed,
    Object? explicit = freezed,
    Object? href = freezed,
    Object? id = freezed,
    Object? name = freezed,
    Object? popularity = freezed,
    Object? preview_url = freezed,
    Object? type = freezed,
    Object? uri = freezed,
  }) {
    return _then(_SpotifyTrack(
      artists: artists == freezed
          ? _value.artists
          : artists // ignore: cast_nullable_to_non_nullable
              as List<SpotifyArtist>,
      duration_ms: duration_ms == freezed
          ? _value.duration_ms
          : duration_ms // ignore: cast_nullable_to_non_nullable
              as int,
      explicit: explicit == freezed
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool,
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
      popularity: popularity == freezed
          ? _value.popularity
          : popularity // ignore: cast_nullable_to_non_nullable
              as int,
      preview_url: preview_url == freezed
          ? _value.preview_url
          : preview_url // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$_SpotifyTrack implements _SpotifyTrack {
  _$_SpotifyTrack(
      {this.artists = const [],
      required this.duration_ms,
      required this.explicit,
      required this.href,
      required this.id,
      required this.name,
      this.popularity = 0,
      this.preview_url,
      required this.type,
      required this.uri});

  factory _$_SpotifyTrack.fromJson(Map<String, dynamic> json) =>
      _$_$_SpotifyTrackFromJson(json);

  @JsonKey(defaultValue: const [])
  @override
  final List<SpotifyArtist> artists;
  @override
  final int duration_ms;
  @override
  final bool explicit;
  @override
  final String href;
  @override
  final String id;
  @override
  final String name;
  @JsonKey(defaultValue: 0)
  @override
  final int popularity;
  @override
  final String? preview_url;
  @override
  final String type;
  @override
  final String uri;

  @override
  String toString() {
    return 'SpotifyTrack(artists: $artists, duration_ms: $duration_ms, explicit: $explicit, href: $href, id: $id, name: $name, popularity: $popularity, preview_url: $preview_url, type: $type, uri: $uri)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SpotifyTrack &&
            (identical(other.artists, artists) ||
                const DeepCollectionEquality()
                    .equals(other.artists, artists)) &&
            (identical(other.duration_ms, duration_ms) ||
                const DeepCollectionEquality()
                    .equals(other.duration_ms, duration_ms)) &&
            (identical(other.explicit, explicit) ||
                const DeepCollectionEquality()
                    .equals(other.explicit, explicit)) &&
            (identical(other.href, href) ||
                const DeepCollectionEquality().equals(other.href, href)) &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.popularity, popularity) ||
                const DeepCollectionEquality()
                    .equals(other.popularity, popularity)) &&
            (identical(other.preview_url, preview_url) ||
                const DeepCollectionEquality()
                    .equals(other.preview_url, preview_url)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.uri, uri) ||
                const DeepCollectionEquality().equals(other.uri, uri)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(artists) ^
      const DeepCollectionEquality().hash(duration_ms) ^
      const DeepCollectionEquality().hash(explicit) ^
      const DeepCollectionEquality().hash(href) ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(popularity) ^
      const DeepCollectionEquality().hash(preview_url) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(uri);

  @JsonKey(ignore: true)
  @override
  _$SpotifyTrackCopyWith<_SpotifyTrack> get copyWith =>
      __$SpotifyTrackCopyWithImpl<_SpotifyTrack>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SpotifyTrackToJson(this);
  }
}

abstract class _SpotifyTrack implements SpotifyTrack {
  factory _SpotifyTrack(
      {List<SpotifyArtist> artists,
      required int duration_ms,
      required bool explicit,
      required String href,
      required String id,
      required String name,
      int popularity,
      String? preview_url,
      required String type,
      required String uri}) = _$_SpotifyTrack;

  factory _SpotifyTrack.fromJson(Map<String, dynamic> json) =
      _$_SpotifyTrack.fromJson;

  @override
  List<SpotifyArtist> get artists => throw _privateConstructorUsedError;
  @override
  int get duration_ms => throw _privateConstructorUsedError;
  @override
  bool get explicit => throw _privateConstructorUsedError;
  @override
  String get href => throw _privateConstructorUsedError;
  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  int get popularity => throw _privateConstructorUsedError;
  @override
  String? get preview_url => throw _privateConstructorUsedError;
  @override
  String get type => throw _privateConstructorUsedError;
  @override
  String get uri => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SpotifyTrackCopyWith<_SpotifyTrack> get copyWith =>
      throw _privateConstructorUsedError;
}

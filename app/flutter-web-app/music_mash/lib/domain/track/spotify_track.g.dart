// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpotifyTrack _$_$_SpotifyTrackFromJson(Map<String, dynamic> json) {
  return _$_SpotifyTrack(
    artists: (json['artists'] as List<dynamic>?)
            ?.map((e) => SpotifyArtist.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    duration_ms: json['duration_ms'] as int,
    explicit: json['explicit'] as bool,
    href: json['href'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    popularity: json['popularity'] as int? ?? 0,
    preview_url: json['preview_url'] as String?,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

Map<String, dynamic> _$_$_SpotifyTrackToJson(_$_SpotifyTrack instance) =>
    <String, dynamic>{
      'artists': instance.artists,
      'duration_ms': instance.duration_ms,
      'explicit': instance.explicit,
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'popularity': instance.popularity,
      'preview_url': instance.preview_url,
      'type': instance.type,
      'uri': instance.uri,
    };

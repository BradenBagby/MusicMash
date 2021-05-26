// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spotify_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpotifyArtist _$_$_SpotifyArtistFromJson(Map<String, dynamic> json) {
  return _$_SpotifyArtist(
    href: json['href'] as String,
    id: json['id'] as String,
    name: json['name'] as String,
    type: json['type'] as String,
    uri: json['uri'] as String,
  );
}

Map<String, dynamic> _$_$_SpotifyArtistToJson(_$_SpotifyArtist instance) =>
    <String, dynamic>{
      'href': instance.href,
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'uri': instance.uri,
    };

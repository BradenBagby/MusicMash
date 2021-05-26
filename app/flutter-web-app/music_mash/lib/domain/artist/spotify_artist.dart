import 'package:freezed_annotation/freezed_annotation.dart';

part 'spotify_artist.freezed.dart';
part 'spotify_artist.g.dart';

@freezed
class SpotifyArtist with _$SpotifyArtist {
  factory SpotifyArtist(
      {required String href,
      required String id,
      required String name,
      required String type,
      required String uri}) = _SpotifyArtist;
  factory SpotifyArtist.fromJson(Map<String, dynamic> json) =>
      _$SpotifyArtistFromJson(json);
}

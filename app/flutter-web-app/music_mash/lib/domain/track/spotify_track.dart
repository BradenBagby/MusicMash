import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:music_mash/domain/artist/spotify_artist.dart';

part 'spotify_track.freezed.dart';
part 'spotify_track.g.dart';

@freezed
class SpotifyTrack with _$SpotifyTrack {
  factory SpotifyTrack({
    @Default([]) List<SpotifyArtist> artists,
    required int duration_ms,
    required bool explicit,
    required String href,
    required String id,
    required String name,
    @Default(0) int popularity,
    String? preview_url,
    required String type,
    required String uri,
  }) = _SpotifyTrack;
  factory SpotifyTrack.fromJson(Map<String, dynamic> json) =>
      _$SpotifyTrackFromJson(json);
}

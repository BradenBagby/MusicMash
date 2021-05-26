import 'package:flutter/material.dart';
import 'package:music_mash/domain/track/spotify_track.dart';

class MusicCard extends StatelessWidget {
  final SpotifyTrack track;
  MusicCard(this.track);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            track.name,
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.center,
            maxLines: 3,
          ),
          Text(
            track.artists.map((e) => e.name).toList().join(", "),
            style: Theme.of(context).textTheme.subtitle1,
            textAlign: TextAlign.center,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

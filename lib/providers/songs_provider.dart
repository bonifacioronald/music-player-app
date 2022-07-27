import 'package:flutter/material.dart';
import 'package:music_player_app/models/song.dart';

class SongsProvider with ChangeNotifier {
  List<Song> songsProviderList = [
    Song(
      title: 'Bus To Chilicothe',
      coverImageUrl:
          'https://tribeofnoisestorage.blob.core.windows.net/images/44281/photo_1474135186.png',
      audioUrl: 'https://prosearch.tribeofnoise.com/artists/show/33126/35431',
      artist: 'Matt Rouch',
      duration: '2:02',
      isFavorited: false,
      isPlaying: false,
    ),
    Song(
      title: 'Over the Mountain',
      coverImageUrl:
          'https://tribeofnoisestorage.blob.core.windows.net/images/42897/photo_1456449002.jpg',
      audioUrl: 'https://prosearch.tribeofnoise.com/artists/show/42897/22761',
      artist: 'blancey',
      duration: '3:14',
      isFavorited: false,
      isPlaying: false,
    ),
    Song(
      title: 'Fall To Pieces',
      coverImageUrl:
          'https://tribeofnoisestorage.blob.core.windows.net/images/35255/photo_1568845101.jpg',
      audioUrl: 'https://prosearch.tribeofnoise.com/artists/show/35255/37110',
      artist: 'derekclegg',
      duration: '3:45',
      isFavorited: false,
      isPlaying: false,
    ),
    Song(
      title: 'Let You Go',
      coverImageUrl:
          'https://tribeofnoisestorage.blob.core.windows.net/images/71800/photo_1617517406.jpg',
      audioUrl: 'https://prosearch.tribeofnoise.com/artists/show/71800/38529',
      artist: 'MarcusWay',
      duration: '3:03',
      isFavorited: false,
      isPlaying: false,
    ),
    Song(
      title: 'Malone Morning',
      coverImageUrl:
          'https://tribeofnoisestorage.blob.core.windows.net/images/45112/photo_1487710130.jpg',
      audioUrl: 'https://prosearch.tribeofnoise.com/artists/show/45112/36196',
      artist: 'roelandruijsch',
      duration: '2:58',
      isFavorited: false,
      isPlaying: false,
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:music_player_app/models/playlist.dart';

class PlaylistsProvider with ChangeNotifier {
  List<Playlist> playlistsProviderList = [
    Playlist(
      title: 'Relax',
      coverImageUrl:
          'https://images.pexels.com/photos/4553622/pexels-photo-4553622.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Playlist(
      title: 'Mood',
      coverImageUrl:
          'https://images.pexels.com/photos/1738675/pexels-photo-1738675.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    Playlist(
      title: 'Lone',
      coverImageUrl:
          'https://images.pexels.com/photos/5187098/pexels-photo-5187098.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
  ];
}

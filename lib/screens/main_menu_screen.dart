import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:music_player_app/models/song.dart';
import 'package:music_player_app/providers/playlists_provider.dart';
import 'package:music_player_app/providers/songs_provider.dart';
import 'package:music_player_app/widgets/main_menu_song_player.dart';
import 'package:music_player_app/widgets/playlist_card.dart';
import 'package:music_player_app/widgets/song_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:music_player_app/models/playlist.dart';
import '../models/colors.dart' as custom_colors;

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Playlist> playlistsData =
        Provider.of<PlaylistsProvider>(context, listen: false)
            .playlistsProviderList;
    List<Song> songsData =
        Provider.of<SongsProvider>(context, listen: false).songsProviderList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: custom_colors.pinkPrimary,
        elevation: 0,
        title: Text(
          'Discover',
          style: TextStyle(
              fontSize: 28,
              letterSpacing: 1,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ))
        ],
      ),
      bottomNavigationBar: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            color: Colors.black,
          ),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: GNav(
              color: Colors.black,
              activeColor: custom_colors.pinkPrimary,
              padding: EdgeInsets.zero,
              gap: 12,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.search,
                  text: 'Search',
                ),
                GButton(
                  icon: Icons.collections_bookmark_rounded,
                  text: 'Playlist',
                ),
                GButton(
                  icon: Icons.favorite,
                  text: 'Favorite',
                ),
              ],
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 290,
                width: double.infinity,
                child: Stack(
                  children: [
                    //Pink 240 container
                    Container(
                      height: 240,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: custom_colors.pinkPrimary,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40))),
                    ),

                    //Playlist
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20.0),
                                child: RotatedBox(
                                  quarterTurns: -1,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Your Playlists',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Icon(
                                        Icons.collections_bookmark_rounded,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 6,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: playlistsData.length,
                                    itemBuilder: (_, index) {
                                      return PlaylistCard(playlistsData[index]);
                                    }),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: RotatedBox(
                          quarterTurns: -1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Liked',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 40,
                              ),
                              Text(
                                'Recent',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(right: 20.0, left: 8),
                        child: ListView.builder(
                          itemCount: songsData.length,
                          itemBuilder: (_, index) {
                            return SongListTile(songsData[index]);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: MainMenuSongPlayer(songsData[0]),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../models/colors.dart' as custom_colors;
import '../models/song.dart';
import '../providers/playlists_provider.dart';
import '../providers/songs_provider.dart';
import '../widgets/main_menu_song_player.dart';
import '../widgets/playlist_card.dart';
import '../widgets/song_list.dart';
import '../models/playlist.dart';

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
        title: const Text(
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
              icon: const Icon(
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: GNav(
              color: Colors.black,
              activeColor: custom_colors.pinkPrimary,
              padding: EdgeInsets.zero,
              gap: 12,
              tabs: const [
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
                  icon: Icons.account_circle_rounded,
                  text: 'Account',
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
                          borderRadius: const BorderRadius.only(
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
                                            height: 1,
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
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Expanded(
                child: SongList(),
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

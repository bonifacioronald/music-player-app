import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/colors.dart' as custom_colors;
import '../providers/songs_provider.dart';
import '../widgets/song_list_tile_item.dart';
import '../models/song.dart';

class SongList extends StatefulWidget {
  @override
  State<SongList> createState() => _SongListState();
}

class _SongListState extends State<SongList> {
  bool isShowingRecent = true;

  @override
  Widget build(BuildContext context) {
    List<Song> songsData =
        Provider.of<SongsProvider>(context, listen: false).songsProviderList;
    List<Song> favoritedSongsData =
        Provider.of<SongsProvider>(context, listen: false).favoritedSongs;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: RotatedBox(
              quarterTurns: -1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (isShowingRecent == true) {
                        setState(() {
                          isShowingRecent = false;
                        });
                      }
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 10,
                          height: 4,
                          decoration: BoxDecoration(
                              color: isShowingRecent
                                  ? Colors.transparent
                                  : custom_colors.pinkPrimary,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Liked',
                          style: TextStyle(
                              height: 1,
                              fontSize: 16,
                              color: isShowingRecent
                                  ? Colors.black54
                                  : Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (isShowingRecent == false) {
                        setState(() {
                          isShowingRecent = true;
                        });
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 10,
                          height: 4,
                          decoration: BoxDecoration(
                              color: isShowingRecent
                                  ? custom_colors.pinkPrimary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4)),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          'Recent',
                          style: TextStyle(
                              height: 1,
                              fontSize: 16,
                              color: isShowingRecent
                                  ? Colors.black
                                  : Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 8),
            child: ListView.builder(
              itemCount: isShowingRecent
                  ? songsData.length
                  : favoritedSongsData.length,
              itemBuilder: (_, index) {
                return Column(
                  children: [
                    SongListTile(isShowingRecent
                        ? songsData[index]
                        : favoritedSongsData[index]),
                    SizedBox(
                      height: index == songsData.length - 1 ? 100 : 0,
                    )
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

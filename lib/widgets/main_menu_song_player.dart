import 'package:flutter/material.dart';
import 'package:music_player_app/models/song.dart';
import '../models/colors.dart' as custom_colors;

class MainMenuSongPlayer extends StatelessWidget {
  Song data;

  MainMenuSongPlayer(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Center(
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 23,
            backgroundColor: Colors.white,
            child: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(data.coverImageUrl),
            ),
          ),
          title: Text(
            data.title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(
            data.artist,
            style:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7)),
          ),
          trailing: Container(
            width: 60,
            //color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite,
                  color: custom_colors.pinkPrimary,
                ),
                Icon(
                  Icons.pause,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

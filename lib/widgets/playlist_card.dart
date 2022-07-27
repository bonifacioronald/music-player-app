import 'package:flutter/material.dart';
import 'package:music_player_app/models/playlist.dart';
import '../models/colors.dart' as custom_colors;

class PlaylistCard extends StatelessWidget {
  Playlist data;

  PlaylistCard(this.data);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 40),
      padding: EdgeInsets.all(20),
      width: 220,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            data.coverImageUrl,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.white),
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                  child: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:music_player_app/models/song.dart';
import '../models/colors.dart' as custom_colors;

class SongListTile extends StatelessWidget {
  Song data;

  SongListTile(this.data);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            height: 52,
            width: 52,
            child: Image.network(
              data.coverImageUrl,
              fit: BoxFit.cover,
            )),
      ),
      title: Text(
        data.title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        data.artist,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      trailing: Text(
        data.duration,
        style: TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    );
  }
}

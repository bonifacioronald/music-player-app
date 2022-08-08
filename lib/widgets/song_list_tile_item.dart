import 'package:flutter/material.dart';
import '../models/song.dart';

class SongListTile extends StatelessWidget {
  Song data;

  SongListTile(this.data, {Key? key}) : super(key: key);

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
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        data.artist,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      trailing: Text(
        data.duration,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
    );
  }
}

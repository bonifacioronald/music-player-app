import 'package:flutter/material.dart';
import '../models/colors.dart' as custom_colors;
import '../models/song.dart';

class MainMenuSongPlayer extends StatefulWidget {
  Song data;

  MainMenuSongPlayer(this.data, {Key? key}) : super(key: key);

  @override
  State<MainMenuSongPlayer> createState() => _MainMenuSongPlayerState();
}

class _MainMenuSongPlayerState extends State<MainMenuSongPlayer>
    with TickerProviderStateMixin {
  bool musicIsPaused = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
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
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_controller),
              child: CircleAvatar(
                radius: 22,
                backgroundImage: NetworkImage(widget.data.coverImageUrl),
              ),
            ),
          ),
          title: Text(
            widget.data.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            widget.data.artist,
            style:
                TextStyle(fontSize: 14, color: Colors.white.withOpacity(0.7)),
          ),
          trailing: Container(
            width: 64,
            //color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      widget.data.isFavorited = !widget.data.isFavorited;
                    });
                  },
                  child: Icon(
                    widget.data.isFavorited
                        ? Icons.favorite
                        : Icons.favorite_border,
                    color: widget.data.isFavorited
                        ? custom_colors.pinkPrimary
                        : Colors.white,
                  ),
                ),
                musicIsPaused
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            musicIsPaused = false;
                            _controller.repeat();
                          });
                        },
                        child: const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          setState(() {
                            musicIsPaused = true;
                            _controller.stop();
                          });
                        },
                        child: const Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 28,
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

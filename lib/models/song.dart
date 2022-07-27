class Song {
  String title;
  String coverImageUrl;
  String audioUrl;
  String artist;
  String duration;
  bool isPlaying;
  bool isFavorited;

  Song(
      {required this.title,
      required this.coverImageUrl,
      required this.audioUrl,
      required this.artist,
      required this.duration,
      required this.isFavorited,
      required this.isPlaying});
}

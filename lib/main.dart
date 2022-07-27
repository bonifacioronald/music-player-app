import 'package:flutter/material.dart';
import 'package:music_player_app/providers/playlists_provider.dart';
import 'package:music_player_app/providers/songs_provider.dart';
import 'package:provider/provider.dart';

import './screens/main_menu_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => SongsProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => PlaylistsProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(fontFamily: 'Hyperspacerace'),
        home: MainMenuScreen(),
        routes: {},
      ),
    );
  }
}

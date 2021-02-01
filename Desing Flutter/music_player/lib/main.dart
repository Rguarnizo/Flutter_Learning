import 'package:flutter/material.dart';
import 'package:music_player/models/audioplayer_model.dart';
import 'package:music_player/pages/music_player.dart';
import 'package:music_player/themes/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AudioPlayerModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Music Player',
        theme: miTema,
        home: MusicPlayerPage(),
      ),
    );
  }
}
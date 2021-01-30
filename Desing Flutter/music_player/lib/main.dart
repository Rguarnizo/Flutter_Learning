import 'package:flutter/material.dart';
import 'package:music_player/pages/music_player.dart';
import 'package:music_player/themes/theme.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: miTema,
      home: MusicPlayerPage(),
    );
  }
}
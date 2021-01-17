import 'package:flutter/material.dart';
import 'package:headers/src/Challenges/cuadrado_animado_page.dart';
import 'package:headers/src/pages/animaciones_page.dart';
import 'package:headers/src/labs/circular_progress_page.dart';
import 'package:headers/src/pages/emergency_page.dart';
import 'package:headers/src/pages/graficas_circulares_page.dart';
import 'package:headers/src/pages/headers_page.dart';
import 'package:headers/src/pages/launcher_page.dart';
import 'package:headers/src/pages/pinterest_page.dart';
import 'package:headers/src/pages/slider_list_page.dart';
import 'package:headers/src/pages/slideshow_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LauncherPage(),
    );
  }
} 
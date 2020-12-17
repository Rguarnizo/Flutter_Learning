import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_widgets/src/pages/basico_page.dart';
import 'package:ui_widgets/src/pages/botones_page.dart';
import 'package:ui_widgets/src/pages/scroll_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'UI Widgets',
      debugShowCheckedModeBanner: false,
      routes: {
        'BasicPage': (BuildContext context) => BasicPage(),
        'ScrollPage': (BuildContext context) => ScrollPage(),
        'BotonesPage': (BuildContext context) => BotonesPage(),
      },
      initialRoute: 'BotonesPage',
    );
  }
}

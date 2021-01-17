import 'package:flutter/material.dart';
import 'package:headers/src/pages/launcher_page.dart';

import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(ChangeNotifierProvider(
  create: (_) => new ThemeChanger(),
  child: MyApp()
  ));
 
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
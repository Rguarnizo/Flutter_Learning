import 'package:flutter/material.dart';
import 'package:headers/src/pages/launcher_page.dart';
import 'package:headers/src/pages/launcher_tablet_page.dart';

import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(ChangeNotifierProvider(
  create: (_) => new ThemeChanger(2),
  child: MyApp()
  ));
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final themeData = Provider.of<ThemeChanger>(context);


    return MaterialApp(      
      theme: themeData.currentTheme,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: OrientationBuilder(builder: (context,orientation){ 
        
        final screenSize = MediaQuery.of(context).size;
        if(screenSize.width > 500){
          return LauncherTabletPage();
        }else{
          return LauncherPage();          
        }
        }),
    );
  }
} 
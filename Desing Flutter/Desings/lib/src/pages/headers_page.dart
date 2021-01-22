import 'package:flutter/material.dart';
import 'package:headers/src/theme/theme.dart';
import 'package:headers/src/widgets/headers.dart';
import 'package:provider/provider.dart';

class HeadersPage extends StatelessWidget {
  const HeadersPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    return Scaffold(
      body: HeaderWaves(color: appTheme.currentTheme.accentColor,),
    );
  }
}
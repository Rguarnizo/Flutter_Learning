import 'package:flutter/material.dart';

class PinteresButton{
  final Function onPressed;
  final IconData icons;

  PinteresButton({this.onPressed, this.icons});
}



class PinterestMenu extends StatelessWidget {

  final List<PinteresButton> items = [
    PinteresButton(icons: Icons.pie_chart,onPressed: (){print('Icon pie');}),
    PinteresButton(icons: Icons.search,onPressed: (){print('Icon search');}),
    PinteresButton(icons: Icons.notification_important,onPressed: (){print('Icon notificacion');}),
    PinteresButton(icons: Icons.supervised_user_circle,onPressed: (){print('Icon user');}),
  ];


  const PinterestMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
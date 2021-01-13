import 'package:flutter/material.dart';

class PinterestButton {
  final Function onPressed;
  final IconData icons;

  PinterestButton({this.onPressed, this.icons});
}

class PinterestMenu extends StatelessWidget {
  final List<PinterestButton> items = [
    PinterestButton(
        icons: Icons.pie_chart,
        onPressed: () {
          print('Icon pie');
        }),
    PinterestButton(
        icons: Icons.search,
        onPressed: () {
          print('Icon search');
        }),
    PinterestButton(
        icons: Icons.notification_important,
        onPressed: () {
          print('Icon notificacion');
        }),
    PinterestButton(
        icons: Icons.supervised_user_circle,
        onPressed: () {
          print('Icon user');
        }),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(

      child: _MenuItems(menuItems: items),
      width: 250,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.black38,
                offset: Offset(10, 10),
                blurRadius: 10,
                spreadRadius: -5)
          ]),
      
    );
  }
}


class _MenuItems extends StatelessWidget {

  final List<PinterestButton> menuItems;

  const _MenuItems({Key key, this.menuItems}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(List.generate(menuItems.length, (i) => _PinterestMenuButton(i,menuItems[i]))
      )
    );
  }
}


class PinterestMenuItem extends StatelessWidget {

  final int index;
  final PinterestButton item;

  const PinterestMenuItem({Key key, this.index, this.item}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(item.icons),
    );
  }
}
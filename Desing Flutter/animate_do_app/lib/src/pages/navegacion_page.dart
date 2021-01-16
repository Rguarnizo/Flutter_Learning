import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification page'),
        backgroundColor: Colors.pink,
      ),
      floatingActionButton: BotonFlotante(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bone), label: 'Bones'),
        BottomNavigationBarItem(
            icon: Stack(
              children: [
                FaIcon(FontAwesomeIcons.bell),
                //Positioned(child: Icon(Icons.brightness_1,size:8,color:Colors.pink),right: 0,top: 0,)
                Positioned(
                  child: Container(
                    width: 12,
                    height: 12,
                    child: Text('99',style: TextStyle(color: Colors.white,fontSize: 7,fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                        color: Colors.pink, shape: BoxShape.circle),
                        alignment: Alignment.center,
                  ),
                  top: 0,
                  right: 0,
                )
              ],
            ),
            label: 'Notifications'),
        BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.dog), label: 'My Dog'),
      ],
    );
  }
}

class BotonFlotante extends StatelessWidget {
  const BotonFlotante({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: FaIcon(FontAwesomeIcons.play, color: Colors.pink),
    );
  }
}

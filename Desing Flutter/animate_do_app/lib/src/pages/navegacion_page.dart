import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NotificationModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notification page'),
          backgroundColor: Colors.pink,
        ),
        floatingActionButton: BotonFlotante(),
        bottomNavigationBar: BottomNavigation(),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final int numero = Provider.of<_NotificationModel>(context).numero;

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
                  child: BounceInDown(
                    from: 20,
                    animate: (numero >0)? true:false,
                    child: Bounce(
                      from:20,
                      controller: (controller) =>Provider.of<_NotificationModel>(context).bounceController = controller,
                      child: Container(
                        width: 12,
                        height: 12,
                        child: Text('$numero',style: TextStyle(color: Colors.white,fontSize: 7,fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                            color: Colors.pink, shape: BoxShape.circle),
                            alignment: Alignment.center,
                      ),
                    ),
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
      onPressed: () {
        Provider.of<_NotificationModel>(context,listen: false).numero++;    
        Provider.of<_NotificationModel>(context,listen:false).bounceController.forward(from: 0.0);
      },
      child: FaIcon(FontAwesomeIcons.play, color: Colors.pink),
    );
  }
}


class _NotificationModel extends ChangeNotifier{

  int _numero = 0;
  AnimationController _bounceController;


  int get numero => this._numero;

  set numero(int numero){
    this._numero = numero;
    notifyListeners();
  }
  AnimationController get bounceController => this._bounceController;

  set bounceController(AnimationController ctrl){
    _bounceController = ctrl;
  }
}
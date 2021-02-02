import 'package:flutter/material.dart';
import 'package:transiciones/pages/pagina2_page.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: Text('Pagina 1'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, _crearRuta());
        },
        child: Icon(Icons.access_time),
      ),
      body: Center(
        child: Text('Pagina1'),
      ),
    );
  }

  Route _crearRuta() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Pagina2Page(),
      //transitionDuration: Duration(seconds: 2),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        
        final curveAnimation = CurvedAnimation(parent: animation, curve: Curves.easeInOut);

        // return SlideTransition(position: Tween<Offset>(begin: Offset(0.5,1.0),end: Offset.zero ).animate(curveAnimation),
        // child: child,);

        return ScaleTransition(scale: Tween<double>(begin: 0.0,end: 1.0).animate(curveAnimation));

      },
    );
  }
}

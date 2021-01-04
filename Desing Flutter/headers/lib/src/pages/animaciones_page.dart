import 'package:flutter/material.dart';

class AnimacionesPage extends StatelessWidget {
  const AnimacionesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class _Rectangulo extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.blue
       ),
     );
   }
}

class CuadradoAnimado extends StatefulWidget {
  const CuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin{

  //! Es parecido a una barra de reproducción (Por ejemplo la de Youtube).  
  AnimationController _animationController;
    
  Animation<double> rotacion;

  @override
  void initState() { 
    _animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));
    rotacion = Tween(begin: 0.0,end: 2.0).animate(_animationController);
    _animationController.forward();
    super.initState();
    
  }

  @override
  void dispose() {

    _animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return _Rectangulo();
  }
}





import 'package:flutter/material.dart';
import 'dart:math' as Math;

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
  Animation<double> opacidad;

  @override
  void initState() { 
    _animationController = new AnimationController(vsync: this,duration: Duration(milliseconds: 4000));
    
    rotacion = Tween(begin: 0.0,end: 2.0 * Math.pi).animate(
      CurvedAnimation(parent: _animationController,curve: Curves.bounceOut)
    );

    //! Diferente Duración!
    opacidad = Tween(begin: 0.1,end: 1.0).animate(CurvedAnimation(parent: _animationController,curve: Interval(0.5,1,curve: Curves.bounceOut)));


    _animationController.addListener(() {
      print('Status: ${_animationController.status}');
      if(_animationController.status == AnimationStatus.completed){
        _animationController.reverse();
      }else if (_animationController.status == AnimationStatus.dismissed){
        _animationController.forward();
      }
    });
    
    super.initState();
    
  }

  @override
  void dispose() {

    _animationController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {

    //? Play / Reproducción
    _animationController.forward();

    return AnimatedBuilder(animation: _animationController,child: _Rectangulo() ,builder: (context, child) {
      print('Rotación: ${rotacion.value}');
      return Transform.rotate(angle: rotacion.value,child: Opacity(opacity: opacidad.value, child: child,));
    },);
  }
}





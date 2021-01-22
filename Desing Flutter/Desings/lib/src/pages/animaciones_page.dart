import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:headers/src/theme/theme.dart';
import 'package:provider/provider.dart';

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
    final appTheme = Provider.of<ThemeChanger>(context);
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: appTheme.currentTheme.accentColor),
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

class _CuadradoAnimadoState extends State<CuadradoAnimado>
    with SingleTickerProviderStateMixin {
  //! Es parecido a una barra de reproducción (Por ejemplo la de Youtube).
  AnimationController _animationController;

  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> mover;
  Animation<double> escalar;

  @override
  void initState() {
    _animationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween(begin: 0.0, end: 2.0 * Math.pi).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));

    //! Diferente Duración!
    opacidad = Tween(begin: 0.1, end: 1.0).animate(CurvedAnimation(
        parent: _animationController,
        //! Interval me dice cuando empieza y cuando termina la animación (Porcentajes)
        curve: Interval(0, 1, curve: Curves.bounceOut)));

    opacidadOut = Tween(begin: 1.0,end: 0.0).animate(CurvedAnimation(parent: _animationController,curve: Interval(0.75,1,curve: Curves.easeInOut)));

    
    mover = Tween(begin: 0.0,end:200.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));
    escalar = Tween(begin: 0.0,end:2.0).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut));

    _animationController.addListener(() {
      
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (_animationController.status == AnimationStatus.dismissed) {
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

    return AnimatedBuilder(
      animation: _animationController,
      child: _Rectangulo(),
      builder: (context, child) {
        print('Rotación: ${opacidad.status}');
        print('Opacidad: ${rotacion.status}');
        return Transform.translate(
          offset: Offset(0,mover.value),
          child: Transform.rotate(
              angle: rotacion.value,
              child: Opacity(
                opacity: opacidadOut.value,
                child: Transform.scale(scale: escalar.value,child: child),
              )),
        );
      },
    );
  }
}

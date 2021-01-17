import 'package:flutter/material.dart';

class CuadradoAnimadoPage extends StatelessWidget {
  const CuadradoAnimadoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _cuadradoAnimado()),
    );
  }
}

class _cuadradoAnimado extends StatefulWidget {
  const _cuadradoAnimado({
    Key key,
  }) : super(key: key);

  @override
  _cuadradoAnimadoState createState() => _cuadradoAnimadoState();
}

class _cuadradoAnimadoState extends State<_cuadradoAnimado>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  Animation<double> moveleft;
  Animation<double> moveup;
  Animation<double> moveright;
  Animation<double> movedown;

  @override
  void initState() {
    super.initState();

    //! Inicialización Controller
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 4500));

    //! Inicialización de Animaciones:

    moveleft = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.0, 0.25, curve: Curves.bounceOut)));
    moveup = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.25, 0.5, curve: Curves.bounceOut)));
    moveright = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.5, 0.75, curve: Curves.bounceOut)));
    movedown = Tween(begin: 0.0, end: -100.0).animate(CurvedAnimation(
        parent: _controller,
        curve: Interval(0.75, 1, curve: Curves.bounceOut)));

        _controller.addListener(() {
          if(_controller.status == AnimationStatus.completed){
            _controller.repeat();
          }
        });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      child: Rectangulo(),
      builder: (context, child) {
        return Transform.translate(
        offset: Offset(moveleft.value, -moveup.value),
        child: Transform.translate(
          offset: Offset(moveright.value, -movedown.value),
          child: child,
        ),
      );
      },        
    );
  }
}

class Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(color: Colors.blue),
    );
  }
}

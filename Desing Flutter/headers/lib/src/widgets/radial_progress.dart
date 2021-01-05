import 'dart:math';

import 'package:flutter/material.dart';

class RadialProgress extends StatefulWidget {
  final double porcentaje;
  final Color colorPrimario;
  final Color colorSecundario;
  final double grosorSecundario;
  final double grosorPrimario;

  RadialProgress({Key key,@required this.porcentaje, this.colorPrimario = Colors.blue, this.colorSecundario = Colors.grey, this.grosorSecundario=5, this.grosorPrimario = 10}) : super(key: key);

  @override
  _RadialProgressState createState() => _RadialProgressState();
}

class _RadialProgressState extends State<RadialProgress>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  double porcentajeAnterior;

  @override
  void initState() {
    super.initState();
    porcentajeAnterior = widget.porcentaje;

    controller = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward(from: 0.0);
    final diferenciaAnimar = widget.porcentaje - porcentajeAnterior;
    porcentajeAnterior = widget.porcentaje;

    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: double.infinity,
              child: CustomPaint(
                painter: _MiRadialProgress(
                    (widget.porcentaje - diferenciaAnimar) +
                        (diferenciaAnimar * controller.value),widget.colorPrimario,widget.colorSecundario,widget.grosorSecundario,widget.grosorPrimario),
              ));
        });
  }
}

class _MiRadialProgress extends CustomPainter {
  double porcentaje;
  Color colorPrimario;
  Color colorSecundario;
  double grosorSecundario;
  double grosorPrimario;

  _MiRadialProgress(this.porcentaje,this.colorPrimario,this.colorSecundario,this.grosorSecundario,this.grosorPrimario);

  @override
  void paint(Canvas canvas, Size size) {
    //?Circulo Completado
    final paint = new Paint()
      ..strokeWidth = grosorSecundario
      ..color = colorSecundario
      ..style = PaintingStyle.stroke;

    Offset center = new Offset(size.height * 0.5, size.width * 0.5);
    double radio = min(size.width * 0.5, size.height * 0.5);

    canvas.drawCircle(center, radio, paint);

    //? Arco
    final paintArco = new Paint()
      ..strokeWidth = grosorPrimario
      ..color = colorPrimario
      ..style = PaintingStyle.stroke;

    //? Porcentage Arco
    double arcAngle = 2 * pi * (porcentaje / 100);

    //? Primer argumento es el Rect, el segundo es donde comenzará a dibujar, el punto final del dibujo.
    canvas.drawArc(Rect.fromCircle(center: center, radius: radio), -pi / 2,
        arcAngle, false, paintArco);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

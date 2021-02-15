import 'package:flutter/material.dart';

class MarkerEndPainter extends CustomPainter {
  final String description;
  final double distance;

  MarkerEndPainter({this.description, this.distance});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = Colors.black;

    var radius = 20.0;
    var radiusWhite = 7.0;
        
    canvas.drawCircle(Offset(radius, size.height-radius),radius, paint);
    canvas.drawCircle(Offset(radius, size.height-radius),radiusWhite, paint..color= Colors.white);

    final Path path = new Path();
    path.moveTo(0, 20);
    path.lineTo(size.width-10, 20);
    path.lineTo(size.width-10, 100);
    path.lineTo(0, 100);

    canvas.drawShadow(path, Colors.black87,10, false);

    //Caja blanca
    final whiteBox = Rect.fromLTWH(0, 20, size.width-10, 80);
    canvas.drawRect(whiteBox, paint);
    
    final blackBox = Rect.fromLTWH(0, 20, 70, 80);
    canvas.drawRect(blackBox, paint..color = Colors.black);

    //Dibujar Textos
    final kilometros = (distance/1000).toStringAsFixed(1);
    TextSpan textSpan = new TextSpan(
      text: '$kilometros',
      style: TextStyle(color: Colors.white,fontSize:30,fontWeight: FontWeight.w400)
    );

    final textPainter = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(maxWidth: 70);

    textPainter.paint(canvas, Offset(15,35));

      textSpan = new TextSpan(
      text: 'km',
      style: TextStyle(color: Colors.white,fontSize:23,fontWeight: FontWeight.w400)
    );

    final textPainterT = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center
    )..layout(maxWidth: 70,);

    textPainterT.paint(canvas, Offset(15,65));

    textSpan = new TextSpan(
      text: '$description',
      style: TextStyle(color: Colors.black,fontSize:22,fontWeight: FontWeight.w400)
    );

    final textPainterUb = new TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.left,
      maxLines: 2,
      ellipsis: '...'
    )..layout(maxWidth: size.width-130,minWidth: 70);

    textPainterUb.paint(canvas, Offset(100,40));



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

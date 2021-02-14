import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MarkerStart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = Colors.black;

    var radius = 20.0;
    var radiusWhite = 7.0;
        
    canvas.drawCircle(Offset(radius, size.height-radius),radius, paint);
    canvas.drawCircle(Offset(radius, size.height-radius),radiusWhite, paint..color= Colors.white);

    final Path path = new Path();
    path.moveTo(40, 20);
    path.lineTo(size.width-10, 20);
    path.lineTo(size.width-10, 100);
    path.lineTo(40, 100);

    canvas.drawShadow(path, Colors.black87,10, false);

    //Caja blanca
    final whiteBox = Rect.fromLTWH(40, 20, size.width-60, 80);
    canvas.drawRect(whiteBox, paint);
    
    final blackBox = Rect.fromLTWH(40, 20, 70, 80);
    canvas.drawRect(blackBox, paint..color = Colors.black);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

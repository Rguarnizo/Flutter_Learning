import 'package:flutter/material.dart';

class HeaderCuadrado extends StatelessWidget {
  const HeaderCuadrado({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Color(0xff615AAB),
    );
  }
}

class HeaderBordesRedondeados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        color: Color(0xff615AAB),
      ),
    );
  }
}

class HeaderDiagonal extends StatelessWidget {
  const HeaderDiagonal({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderDiagonalPainter(),
        ),
      );
  }
}


class _HeaderDiagonalPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      //? Lapiz con el que dibujar
      final paint = new Paint();

      //?Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


      //?Dibujar con el path y el lapiz
      path.lineTo(0, size.height*0.40);
      path.lineTo(size.width,size.height*0.35);
      path.lineTo(size.width,0);
      path.lineTo(0,0);
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }



}

class HeaderTriangular extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderTriangularPainter(),
        ),
      );
  }
}


class _HeaderTriangularPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      //? Lapiz con el que dibujar
      final paint = new Paint();

      //?Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


      //?Dibujar con el path y el lapiz
      path.lineTo(size.width, size.height);
      path.lineTo(0,size.height);
      
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }

}

class HeaderPicudo extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderPicudoPainter(),          
          
        ),
      );
  }
}


class _HeaderPicudoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      //? Lapiz con el que dibujar
      final paint = new Paint();

      //?Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


      //?Dibujar con el path y el lapiz
      path.lineTo(0, size.height*0.3);
      path.lineTo(size.width*0.5, size.height*0.35);
      path.lineTo(size.width, size.height*0.3);
      path.lineTo(size.width,0);
      
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }



}

class HeaderCurvo extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderCurvoPainter(),          
          
        ),
      );
  }
}


class _HeaderCurvoPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      //? Lapiz con el que dibujar
      final paint = new Paint();

      //?Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


      //?Dibujar con el path y el lapiz
      path.lineTo(0, size.height*0.3);
      //! Los primeros valores xy simbolizan el punto en donde tendrá que pasar la curvatura.
      path.quadraticBezierTo(size.width*0.5, size.height*0.35,size.width, size.height*0.3);
      path.lineTo(size.width, 0);
      
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
  }
}


  class HeaderWaves extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderWavesPainter(),          
          
        ),
      );
  }
}


class _HeaderWavesPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      //? Lapiz con el que dibujar
      final paint = new Paint();

      //?Propiedades
      paint.color = Color(0xff615AAB);
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


     path.lineTo(0, size.height*0.3);
      //! Los primeros valores xy simbolizan el punto en donde tendrá que pasar la curvatura.
      path.quadraticBezierTo(size.width*0.25, size.height*0.35,size.width*0.5, size.height*0.3);
      path.quadraticBezierTo(size.width*0.75, size.height*0.25,size.width, size.height*0.3);
      path.lineTo(size.width, 0);

      
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
    }

}
  class HeaderWavesGradient extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
    borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
        //color: Color(0xff615AAB),     
        ),
        child: CustomPaint(
          painter: _HeaderWavesGradientPainter(),          
          
        ),
      );
  }
}


class _HeaderWavesGradientPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      
      final Rect rect = new Rect.fromCircle(
        center: Offset(0,155.0),
        radius: 180,
      );


      final Gradient gradient = new LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        //! Los Colores del gradiente.
        colors: [
          Color(0xff6D05E8),
          Color(0xffC012FF),
          Color(0xff6D05FA),
        ],
        //! Define hasta donde quedan los colores que estan en el gradiente
        stops: [
          0.4,
          0.5,
          1.0
        ]
      );

      //? Lapiz con el que dibujar
      final paint = Paint()..shader = gradient.createShader(rect);

      //?Propiedades
      
      paint.style = PaintingStyle.fill;
      paint.strokeWidth = 5;

      final path = new Path();


     path.lineTo(0, size.height*0.3);
      //! Los primeros valores xy simbolizan el punto en donde tendrá que pasar la curvatura.
      path.quadraticBezierTo(size.width*0.25, size.height*0.35,size.width*0.5, size.height*0.3);
      path.quadraticBezierTo(size.width*0.75, size.height*0.25,size.width, size.height*0.3);
      path.lineTo(size.width, 0);

      
      

      canvas.drawPath(path, paint);

    }
  
    @override
    bool shouldRepaint(covariant CustomPainter oldDelegate) {
    
    return true;
    }

}



class IconHeader extends StatelessWidget {
  const IconHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
          Color(0xff526bf6),
          Color(0xff67acf2)
          
        ])
      ),
    );
  }
}
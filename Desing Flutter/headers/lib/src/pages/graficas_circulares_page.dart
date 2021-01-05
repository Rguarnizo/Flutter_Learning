import 'package:flutter/material.dart';
import 'package:headers/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {
  const GraficasCircularesPage({Key key}) : super(key: key);

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {
  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              porcentaje+=10;
              if(porcentaje > 100) porcentaje =0;
            });
          },
          child: Icon(Icons.refresh),
        ),
        body: Center(
          child: Container(width: 400,height: 400,child: RadialProgress(porcentaje:porcentaje,colorPrimario: Colors.blueAccent,colorSecundario: Colors.pink,),),
          //child: Text('$porcentaje %',style: TextStyle(fontSize: 50) ),
        ));
  }
}

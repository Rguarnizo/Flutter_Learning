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

          child: Table(
              
            children: [
            TableRow(              
              children: [
                Center(child: CustomRadialProgress(porcentaje: porcentaje,color: Colors.brown,)),
                Center(child: CustomRadialProgress(porcentaje: porcentaje*1.2,color: Colors.cyan)),
              ]
            ),
            TableRow(
              children: [
                Center(child: CustomRadialProgress(porcentaje: porcentaje*1.4,color:Colors.amber)),
                Center(child: CustomRadialProgress(porcentaje: porcentaje*1.6,color: Colors.deepPurple)),
              ]
            ),
            TableRow(
              children: [
                Center(child: CustomRadialProgress(porcentaje: porcentaje,color: Colors.lightBlue)),
                Center(child: CustomRadialProgress(porcentaje: porcentaje,color: Colors.red)),
              ]
            )
          ],),
        ),
        );
  }
}

class CustomRadialProgress extends StatelessWidget {
  const CustomRadialProgress({
    Key key,
    @required this.porcentaje,@required this.color,
  }) : super(key: key);

  final Color color;
  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(width: 150,height: 150,child: RadialProgress(porcentaje:porcentaje,colorPrimario: color,colorSecundario: Colors.black,),);
  }
}

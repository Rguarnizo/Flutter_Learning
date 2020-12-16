import 'package:flutter/material.dart';



class AlertPage extends StatelessWidget {
  const AlertPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('AlertPage'),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.arrow_back),onPressed: () {
          Navigator.pop(context);
        },),
        body: Center(
          child: RaisedButton(
            child: Text('Mostrar Alerta'),
            color: Colors.blue,
            textColor: Colors.white,
            shape: StadiumBorder(),
            onPressed: () => _mostrarAlerta(context) ,
          ),
        ),
      );
  }
}

void _mostrarAlerta(BuildContext context){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context){
      return AlertDialog(
        title: Text('Titulo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Este es el contenido de la caja de la alerta'),
            FlutterLogo(size: 100,)
            
          ],

          
        ),
        actions: [
          FlatButton(child: Text('Cancelar'),onPressed: () => Navigator.of(context).pop(),),
          FlatButton(onPressed: ()=> Navigator.of(context).pop(), child: Text('Ok'))
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      );
    });
}
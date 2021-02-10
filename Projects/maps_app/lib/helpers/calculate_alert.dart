

part of 'helpers.dart';


void calculateAlert(BuildContext context){
  if(Platform.isAndroid){
    showDialog(context: context, builder: (context) => AlertDialog(title: Text('Espera por favor...'),content: Text('Calculando ruta'),),);
  }
}

part of 'helpers.dart';

void calculateAlert(BuildContext context) {
  if (Platform.isAndroid)
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Espera por favor...'),
        content: Text('Calculando ruta'),
      ),
    );
  else showCupertinoDialog(context: context, builder: (context) => CupertinoAlertDialog(
    title: Text('Espere por favor'),
    content: CupertinoActivityIndicator(),
  ));
}

import 'package:flutter/material.dart';
import 'package:qr_reader/src/providers/db_provider.dart';

class MapaPage extends StatelessWidget {
  const MapaPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final ScanModel scanModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: [
          IconButton(icon: Icon(Icons.my_location),onPressed: () {
            
          },)
        ],
      ),
      body: Center(child: Text(scanModel.valor),),
    );
  }
}

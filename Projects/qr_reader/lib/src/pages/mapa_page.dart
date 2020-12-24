import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
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
      body: createMap(scanModel),
    );
  }
}

createMap(ScanModel scan) {
  return FlutterMap(    
    key: UniqueKey(),
    options: MapOptions(      
      center: scan.getLatLng(),
      zoom: 10,
    ),
    layers: [
      _crearMapa(),
    ],
    );
}

_crearMapa() {
  return TileLayerOptions(
    
    urlTemplate: 'https://api.mapbox.com/v4/'
    '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
    additionalOptions: {      
      'accessToken': 'pk.eyJ1Ijoicmd1YXJuaXpvIiwiYSI6ImNrajNhcXo2cTJmNTcycW13YzV4c21qMGIifQ.-dHa_Cue38YShLF-vjMCGQ',      
      'id': 'mapbox.mapbox-streets-v8'
    }
  );
}

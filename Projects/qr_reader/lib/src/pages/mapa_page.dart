import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_reader/src/providers/db_provider.dart';


class MapaPage extends StatelessWidget {
  const MapaPage({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final ScanModel scanModel = ModalRoute.of(context).settings.arguments;
    final MapController mapController = MapController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: [
          IconButton(icon: Icon(Icons.my_location),onPressed: () {
            mapController.move(scanModel.getLatLng(),15);
          },)
        ],
      ),
      body: createMap(scanModel,mapController),
    );
  }
}

createMap(ScanModel scan,mapController) {
  return FlutterMap(    
    mapController: mapController,
    key: UniqueKey(),
    options: MapOptions(      
      center: scan.getLatLng(),
      zoom: 10,
    ),
    layers: [
      _crearMapa(),
      _crearMarcadores(scan),
    ],
    );
}

_crearMarcadores(scan) {
  return MarkerLayerOptions(
    markers: <Marker>[
      Marker(width: 100.0,height: 100.0,point: scan.getLatLng(),builder: (context) => Container(child: Icon(Icons.location_on,size:45,color: Theme.of(context).primaryColor,),)),
    ]
  );
}

_crearMapa() {
  return TileLayerOptions(
    
    urlTemplate: 'https://api.mapbox.com/v4/'
    '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
    additionalOptions: {      
      'accessToken': 'pk.eyJ1Ijoicmd1YXJuaXpvIiwiYSI6ImNrajNhcXo2cTJmNTcycW13YzV4c21qMGIifQ.-dHa_Cue38YShLF-vjMCGQ',      
      'id': 'mapbox.satellite'
      // No se admiten los estilos clasicos!
    }
  );
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_app/helpers/helpers.dart';
import 'package:maps_app/pages/gps_access.dart';
import 'package:permission_handler/permission_handler.dart';

import 'map_page.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: this.checkGpsLocation(context),
          builder: (context, snapshot) {
            return Center(
                child: CircularProgressIndicator(
              strokeWidth: 2,
            ));
          }),
    );
  }

  Future checkGpsLocation(BuildContext context) async {
    //*Permiso GPS
    final gpsPermission = await Permission.location.isGranted;
    //* GPS ACTIVO?
    final gpsActive = await Geolocator.isLocationServiceEnabled();

    await Future.delayed(Duration(milliseconds: 100));
    if (gpsActive && gpsPermission) {
      Navigator.pushReplacement(context, navegarMapFadeIn(context, MapPage()));
      return '';
    } else if(!gpsActive){      
      return 'Active el GPS';
    }else if(!gpsPermission){
      Navigator.pushReplacement(context,navegarMapFadeIn(context, GpsAccessPage()));      
      return 'El permiso de GPS es necesario';
    }
  }
}

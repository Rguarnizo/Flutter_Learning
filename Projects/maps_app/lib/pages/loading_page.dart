import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_app/helpers/helpers.dart';
import 'package:maps_app/pages/gps_access.dart';
import 'package:permission_handler/permission_handler.dart';

import 'map_page.dart';

class LoadingPage extends StatefulWidget {

  
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> with WidgetsBindingObserver{



 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state)async {    
    super.didChangeAppLifecycleState(state);

    if(state == AppLifecycleState.resumed){
      if(await Geolocator.isLocationServiceEnabled()){
        Navigator.pushReplacementNamed(context, 'map');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: this.checkGpsLocation(context),
          builder: (context, snapshot) {
            if (snapshot.hasData) return Center(child: Text('${snapshot.data}'),);
            else return Center(
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
      //Navigator.pushReplacement(context, navegarMapFadeIn(context, MapPage()));
      return 'Todo Bien!';
    } else if(!gpsActive){      
      return 'Active el GPS';
    }else if(!gpsPermission){
      Navigator.pushReplacement(context,navegarMapFadeIn(context, GpsAccessPage()));      
      return 'El permiso de GPS es necesario';
    }
  }
}

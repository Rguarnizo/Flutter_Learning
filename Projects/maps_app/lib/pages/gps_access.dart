


import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class GpsAccessPage extends StatefulWidget {
  @override
  _GpsAccessPageState createState() => _GpsAccessPageState();
}

class _GpsAccessPageState extends State<GpsAccessPage>  with WidgetsBindingObserver{

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {    
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    super.didChangeAppLifecycleState(state);
    if(state == AppLifecycleState.resumed){
      if(await Permission.location.isGranted){
         Navigator.pushReplacementNamed(context, 'loading');
      }
    }

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('To use this application you need active GPS'),
            MaterialButton(              
              child: Text(
                'Solicitar Acceso',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.black,
              shape: StadiumBorder(),
              elevation: 0,
              splashColor: Colors.transparent,
              onPressed: () async{
               
               final status = await Permission.location.request();
               this.accessGps(status);
              },
            )
          ],
        ),
      ),
    );
  }

  void accessGps(PermissionStatus status) {

     switch(status){
       
       case PermissionStatus.granted:
         Navigator.pushReplacementNamed(context, 'loading');
         break;
       case PermissionStatus.denied:         
         break;
       case PermissionStatus.restricted:         
         break;
       case PermissionStatus.permanentlyDenied:
         openAppSettings();
         break;
       case PermissionStatus.undetermined:         
         break;
     }

  }
}

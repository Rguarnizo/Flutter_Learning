import 'package:flutter/material.dart';
import 'package:maps_app/helpers/helpers.dart';
import 'package:maps_app/pages/gps_access.dart';

import 'map_page.dart';


class LoadingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsLocation(context),
        builder: (context, snapshot) {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 2,)
     );
        }
      ),
   );
  }
  
  Future checkGpsLocation(BuildContext context) async {
     await Future.delayed(Duration(milliseconds: 100));

     //Navigator.pushReplacement(context,navegarMapFadeIn(context, MapPage()));
     //Navigator.pushReplacement(context,navegarMapFadeIn(context, GpsAccessPage()));
     print('Loading page Hola mundo!');
   }

}
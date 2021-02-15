import 'package:flutter/material.dart';
import 'package:maps_app/custom_markers/marker_start.dart';


class TestMarkerPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 250,
          color: Colors.red,
          child: CustomPaint(painter: MarkerStart(20),),
        )
     ),
   );
  }
}